class PeriodizationYearsController < ApplicationController
  before_action :set_periodization_year, only: [:show, :edit, :update, :destroy]

  def index
    @periodization_years = PeriodizationYear.all
  end

  def show

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
    @seasonDurationDays = (@year.season_end - @year.season_start).to_i
    @seasonDurationĆycles = @seasonDurationDays / 21
    @ctlBikeRamp = (@year.goal_ctl_bike - 20.0) / @seasonDurationĆycles
    @periodizedBikeRamp = @ctlBikeRamp * 2
    $taperCnt = 3
    $buildCnt = 5
    $baseCnt = @seasonDurationĆycles - $taperCnt + $buildCnt
    @year.periodization_cycles.delete_all

      while $taperCnt > 0 do
        @cycle = @year.periodization_cycles.create(title: "taper_#{$taperCnt}")
        for i in 1..3
          if i % 3 == 0
            @cycle.periodization_weeks.create(title: "low_#{i}")
          else
            @cycle.periodization_weeks.create(title: "load_#{i}")
          end
        end
        $taperCnt -=1
      end

      while $buildCnt > 0 do
        @cycle = @year.periodization_cycles.create(title: "build_#{$buildCnt}")
        for n in 1..3
          if n % 3 == 0
            @cycle.periodization_weeks.create(title: "low_#{i}")
          else
            @cycle.periodization_weeks.create(title: "load_#{i}")
          end
        end
        $buildCnt -=1
      end

      while $baseCnt > 0 do
        @cycle = @year.periodization_cycles.create(title: "base_#{$baseCnt}")
        for c in 1..3
          if c % 3 == 0
            @cycle.periodization_weeks.create(title: "low_#{i}")
          else
            @cycle.periodization_weeks.create(title: "load_#{i}")
          end
        end
        $baseCnt -=1
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
end
