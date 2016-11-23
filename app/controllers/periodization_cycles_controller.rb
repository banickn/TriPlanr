class PeriodizationCyclesController < ApplicationController
  before_action :set_periodization_cycle, only: [:show, :edit, :update, :destroy]

  # GET /periodization_cycles
  # GET /periodization_cycles.json
  def index
    @periodization_cycles = PeriodizationCycle.all
  end

  # GET /periodization_cycles/1
  # GET /periodization_cycles/1.json
  def show
  end

  # GET /periodization_cycles/new
  def new
    @periodization_cycle = PeriodizationCycle.new
  end

  # GET /periodization_cycles/1/edit
  def edit
  end

  # POST /periodization_cycles
  # POST /periodization_cycles.json
  def create
    @periodization_cycle = PeriodizationCycle.new(periodization_cycle_params)

    respond_to do |format|
      if @periodization_cycle.save
        format.html { redirect_to @periodization_cycle, notice: 'Periodization cycle was successfully created.' }
        format.json { render :show, status: :created, location: @periodization_cycle }
      else
        format.html { render :new }
        format.json { render json: @periodization_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periodization_cycles/1
  # PATCH/PUT /periodization_cycles/1.json
  def update
    respond_to do |format|
      if @periodization_cycle.update(periodization_cycle_params)
        format.html { redirect_to @periodization_cycle, notice: 'Periodization cycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @periodization_cycle }
      else
        format.html { render :edit }
        format.json { render json: @periodization_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodization_cycles/1
  # DELETE /periodization_cycles/1.json
  def destroy
    @periodization_cycle.destroy
    respond_to do |format|
      format.html { redirect_to periodization_cycles_url, notice: 'Periodization cycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodization_cycle
      @periodization_cycle = PeriodizationCycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def periodization_cycle_params
      params.require(:periodization_cycle).permit(:title, :type, :goal_ctl_bike, :goal_ctl_run, :goal_ctl_swim, :atp_position, :atp_id)
    end
end
