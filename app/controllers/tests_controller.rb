class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
    @swimTests = Test.where('sport_id' => 1)
    @bikeTests = Test.where('sport_id' => 2)
    @runTests = Test.where('sport_id' => 3)
    @p = Pmc.new
    @atl = @p.calcPMCValues(7)
    @ctl = @p.calcPMCValues(42)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      #f.options[:xAxis][:categories] = @tests.map(&:date)
      f.title({ :text=>"PMC"})
      #f.series(:type=> 'spline',:name=> '20min Power', :data=> @bikeTests.map(&:power) )
      f.series(:type=> 'line',:name=> 'CTL', :color=> '#0477f9', :data=> @ctl )
      f.series(:type=> 'line',:name=> 'ATL', :color=> '#ea02bc', :data=> @atl )
      f.series(:type=> 'column',:name=> 'TSB', :color=> '#ffff00', :data=> @p.calcTSB(@atl,@ctl) )
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:date, :title, :duration, :power, :speed, :distance, :sport_id)
    end
end
