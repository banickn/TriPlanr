require 'test_helper'

class PeriodizationCyclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodization_cycle = periodization_cycles(:one)
  end

  test "should get index" do
    get periodization_cycles_url
    assert_response :success
  end

  test "should get new" do
    get new_periodization_cycle_url
    assert_response :success
  end

  test "should create periodization_cycle" do
    assert_difference('PeriodizationCycle.count') do
      post periodization_cycles_url, params: { periodization_cycle: { atp_id: @periodization_cycle.atp_id, atp_position: @periodization_cycle.atp_position, goal_ctl_bike: @periodization_cycle.goal_ctl_bike, goal_ctl_run: @periodization_cycle.goal_ctl_run, goal_ctl_swim: @periodization_cycle.goal_ctl_swim, title: @periodization_cycle.title, type: @periodization_cycle.type } }
    end

    assert_redirected_to periodization_cycle_url(PeriodizationCycle.last)
  end

  test "should show periodization_cycle" do
    get periodization_cycle_url(@periodization_cycle)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodization_cycle_url(@periodization_cycle)
    assert_response :success
  end

  test "should update periodization_cycle" do
    patch periodization_cycle_url(@periodization_cycle), params: { periodization_cycle: { atp_id: @periodization_cycle.atp_id, atp_position: @periodization_cycle.atp_position, goal_ctl_bike: @periodization_cycle.goal_ctl_bike, goal_ctl_run: @periodization_cycle.goal_ctl_run, goal_ctl_swim: @periodization_cycle.goal_ctl_swim, title: @periodization_cycle.title, type: @periodization_cycle.type } }
    assert_redirected_to periodization_cycle_url(@periodization_cycle)
  end

  test "should destroy periodization_cycle" do
    assert_difference('PeriodizationCycle.count', -1) do
      delete periodization_cycle_url(@periodization_cycle)
    end

    assert_redirected_to periodization_cycles_url
  end
end
