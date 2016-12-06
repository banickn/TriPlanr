class PeriodizationYearsController < ApplicationController
  before_action :set_periodization_year, only: [:show, :edit, :update, :destroy]

  def index
    @pageTitle = "Seasons"
    @periodization_years = PeriodizationYear.all
  end

  def show
    @year = PeriodizationYear.find(params[:id])
    @atpBike, @atpRun, @atpSwim, @atpComb = @year.calcATPValues()
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"ATP"})
      f.plot_options(:line=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" ,
        :marker=>{
          :enabled=>false
      }})
      f.series(:type=> 'column',:name=> 'CTL Swim', :color=> '#3498db', :data=> @atpSwim )
      f.series(:type=> 'column',:name=> 'CTL Bike', :color=> '#e74c3c', :data=> @atpBike )
      f.series(:type=> 'column',:name=> 'CTL Run', :color=> '#2ecc71', :data=> @atpRun )
      f.series(:type=> 'column',:name=> 'CTL Combined', :color=> '#f1c40f', :data=> @atpComb )
    end
    respond_to do |format|
      format.html
    end
  end

  def new
    @periodization_year = PeriodizationYear.new
  end

  def edit
  end

  def create
    @periodization_year = PeriodizationYear.new(periodization_year_params)

    respond_to do |format|
      if @periodization_year.save
        format.html { redirect_to @periodization_year, notice: 'Periodization year was successfully created.' }
        format.json { render :show, status: :created, location: @periodization_year }
      else
        format.html { render :new }
        format.json { render json: @periodization_year.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @periodization_year.update(periodization_year_params)
        format.html { redirect_to @periodization_year, notice: 'Periodization year was successfully updated.' }
        format.json { render :show, status: :ok, location: @periodization_year }
      else
        format.html { render :edit }
        format.json { render json: @periodization_year.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @periodization_year.destroy
    respond_to do |format|
      format.html { redirect_to periodization_years_url, notice: 'Periodization year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calcATP()
    @year = PeriodizationYear.find(params[:id])
    @atpBike, @atpRun, @atpSwim, @atpComb = @year.calcATPValues()
    calculate_year_periodization()
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"ATP"})
      f.plot_options(:line=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" ,
        :marker=>{
          :enabled=>false
      }})
      f.series(:type=> 'column',:name=> 'CTL Swim', :color=> '#3498db', :data=> @atpSwim )
      f.series(:type=> 'column',:name=> 'CTL Bike', :color=> '#e74c3c', :data=> @atpBike )
      f.series(:type=> 'column',:name=> 'CTL Run', :color=> '#2ecc71', :data=> @atpRun )
      f.series(:type=> 'column',:name=> 'CTL Combined', :color=> '#f1c40f', :data=> @atpComb )
    end
    respond_to do |format|
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodization_year
      @periodization_year = PeriodizationYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def periodization_year_params
      params.require(:periodization_year).permit(:title, :season_start, :season_end, :goal_ctl_bike, :goal_ctl_run, :goal_ctl_swim)
    end

    def calculate_year_periodization()
      @year = PeriodizationYear.find(params[:id])
      @bikeWeekCTL = 20
      @runWeekCTL = 30
      @swimWeekCTL = 5
      $weekCountdown = 0
      @year.periodization_cycles.delete_all

      $durationTaper = 3
      $durationBuild = 4 * 3
      $durationBase = 4 * 3
      $durationRampUp = $durationBase + $durationBuild

      $weeksBaseStart = @year.season_end - (7 * ($durationBase + $durationBuild + $durationTaper))
      $weeksBuildStart = @year.season_end - (7 * ($durationBuild + $durationTaper))
      $weeksTaperStart = @year.season_end - (7 * $durationTaper)

      # peak CTL 3 weeks before A competition
      # Planned to decrease CTL by 10%
      $bikePeakCTL = @year.goal_ctl_bike + 0.1 * @year.goal_ctl_bike
      $bikeCTLRamp = ($bikePeakCTL - @bikeWeekCTL) / $durationRampUp
      $perBikeRamp = $bikeCTLRamp * 2

      $runPeakCTL = @year.goal_ctl_run + 0.1 * @year.goal_ctl_run
      $runCTLRamp = ($runPeakCTL - @runWeekCTL) / $durationRampUp
      $perRunRamp = $runCTLRamp * 2

      $swimPeakCTL = @year.goal_ctl_swim + 0.1 * @year.goal_ctl_swim
      $swimCTLRamp = ($swimPeakCTL - @swimWeekCTL) / $durationRampUp
      $perSwimRamp = $swimCTLRamp * 2

      # build an annual trainingsplan
      calculate_mesocycle_periodization(4, "base", $weeksBaseStart)
      calculate_mesocycle_periodization(4, "build", $weeksBuildStart)
      calculate_mesocycle_periodization(1, "taper", $weeksTaperStart)

    end

    def calculate_mesocycle_periodization(weeksDuration, kind, start)
      $i = 1
      while $i < (weeksDuration+1) do
        @cycle = @year.periodization_cycles.create(title: "#{kind}_#{$i}")

        # 2:1 load cycles
        for n in 1..3
          @weekDate = @year.season_end - $weekCountdown

          # Decrease CTL every taper week
          if kind == "taper"
            @bikeWeekCTL -= $bikeCTLRamp
            @runWeekCTL -= $runCTLRamp
            @swimWeekCTL -= $swimCTLRamp
            $microCycle = "tapering_#{n}"
          else

            # Decrease CTL in supercompensation weeks
            if n % 3 == 0
              @bikeWeekCTL -= $bikeCTLRamp
              @runWeekCTL -= $runCTLRamp
              @swimWeekCTL -= $swimCTLRamp
              $microCycle = "low_#{n}"
            else
              @bikeWeekCTL += $perBikeRamp
              @runWeekCTL += $perRunRamp
              @swimWeekCTL += $swimCTLRamp
              $microCycle = "load_#{n}"
            end

          end
          @cycle.periodization_weeks.create(kind: "#{$microCycle}", date: "#{start}",
                                          goal_ctl_bike: "#{@bikeWeekCTL}", goal_ctl_run: "#{@runWeekCTL}",
                                          goal_ctl_swim: "#{@swimWeekCTL}")

          start +=7
        end
        $i +=1
      end
    end

end
