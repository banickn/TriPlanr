require 'test_helper'

class PeriodizationWeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodization_week = periodization_weeks(:one)
  end

  test "should get index" do
    get periodization_weeks_url
    assert_response :success
  end

  test "should get new" do
    get new_periodization_week_url
    assert_response :success
  end

  test "should create periodization_week" do
    assert_difference('PeriodizationWeek.count') do
      post periodization_weeks_url, params: { periodization_week: { cycle_position: @periodization_week.cycle_position, goal_ctl_bike: @periodization_week.goal_ctl_bike, goal_ctl_run: @periodization_week.goal_ctl_run, goal_ctl_swim: @periodization_week.goal_ctl_swim, periodization_cycle_id: @periodization_week.periodization_cycle_id, title: @periodization_week.title, type: @periodization_week.type } }
    end

    assert_redirected_to periodization_week_url(PeriodizationWeek.last)
  end

  test "should show periodization_week" do
    get periodization_week_url(@periodization_week)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodization_week_url(@periodization_week)
    assert_response :success
  end

  test "should update periodization_week" do
    patch periodization_week_url(@periodization_week), params: { periodization_week: { cycle_position: @periodization_week.cycle_position, goal_ctl_bike: @periodization_week.goal_ctl_bike, goal_ctl_run: @periodization_week.goal_ctl_run, goal_ctl_swim: @periodization_week.goal_ctl_swim, periodization_cycle_id: @periodization_week.periodization_cycle_id, title: @periodization_week.title, type: @periodization_week.type } }
    assert_redirected_to periodization_week_url(@periodization_week)
  end

  test "should destroy periodization_week" do
    assert_difference('PeriodizationWeek.count', -1) do
      delete periodization_week_url(@periodization_week)
    end

    assert_redirected_to periodization_weeks_url
  end
end
