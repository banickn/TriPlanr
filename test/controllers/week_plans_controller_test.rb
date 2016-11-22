require 'test_helper'

class WeekPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @week_plan = week_plans(:one)
  end

  test "should get index" do
    get week_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_week_plan_url
    assert_response :success
  end

  test "should create week_plan" do
    assert_difference('WeekPlan.count') do
      post week_plans_url, params: { week_plan: { camp: @week_plan.camp, load_atl: @week_plan.load_atl, load_ctl: @week_plan.load_ctl, load_time: @week_plan.load_time, macro_period: @week_plan.macro_period, meso_period: @week_plan.meso_period } }
    end

    assert_redirected_to week_plan_url(WeekPlan.last)
  end

  test "should show week_plan" do
    get week_plan_url(@week_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_week_plan_url(@week_plan)
    assert_response :success
  end

  test "should update week_plan" do
    patch week_plan_url(@week_plan), params: { week_plan: { camp: @week_plan.camp, load_atl: @week_plan.load_atl, load_ctl: @week_plan.load_ctl, load_time: @week_plan.load_time, macro_period: @week_plan.macro_period, meso_period: @week_plan.meso_period } }
    assert_redirected_to week_plan_url(@week_plan)
  end

  test "should destroy week_plan" do
    assert_difference('WeekPlan.count', -1) do
      delete week_plan_url(@week_plan)
    end

    assert_redirected_to week_plans_url
  end
end
