class PeriodizationYearsController < ApplicationController
  before_action :set_periodization_year, only: [:show, :edit, :update, :destroy]

  # GET /periodization_years
  # GET /periodization_years.json
  def index
    @periodization_years = PeriodizationYear.all
  end

  # GET /periodization_years/1
  # GET /periodization_years/1.json
  def show
  end

  # GET /periodization_years/new
  def new
    @periodization_year = PeriodizationYear.new
  end

  # GET /periodization_years/1/edit
  def edit
  end

  # POST /periodization_years
  # POST /periodization_years.json
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

  # PATCH/PUT /periodization_years/1
  # PATCH/PUT /periodization_years/1.json
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

  # DELETE /periodization_years/1
  # DELETE /periodization_years/1.json
  def destroy
    @periodization_year.destroy
    respond_to do |format|
      format.html { redirect_to periodization_years_url, notice: 'Periodization year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodization_year
      @periodization_year = PeriodizationYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def periodization_year_params
      params.require(:periodization_year).permit(:title)
    end
end
