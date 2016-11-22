class WeekPlansController < ApplicationController
  before_action :set_week_plan, only: [:show, :edit, :update, :destroy]

  def index
    @week_plans = WeekPlan.all
  end

  def show
  end

  def new
    @week_plan = WeekPlan.new
  end

  def edit
  end

  def create
    @week_plan = WeekPlan.new(week_plan_params)

    respond_to do |format|
      if @week_plan.save
        format.html { redirect_to @week_plan, notice: 'Week plan was successfully created.' }
        format.json { render :show, status: :created, location: @week_plan }
      else
        format.html { render :new }
        format.json { render json: @week_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @week_plan.update(week_plan_params)
        format.html { redirect_to @week_plan, notice: 'Week plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @week_plan }
      else
        format.html { render :edit }
        format.json { render json: @week_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @week_plan.destroy
    respond_to do |format|
      format.html { redirect_to week_plans_url, notice: 'Week plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_plan
      @week_plan = WeekPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_plan_params
      params.require(:week_plan).permit(:macro_period, :meso_period, :load_time, :load_atl, :load_ctl, :camp)
    end
end
