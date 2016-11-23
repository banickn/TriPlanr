require 'test_helper'

class PeriodizationYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodization_year = periodization_years(:one)
  end

  test "should get index" do
    get periodization_years_url
    assert_response :success
  end

  test "should get new" do
    get new_periodization_year_url
    assert_response :success
  end

  test "should create periodization_year" do
    assert_difference('PeriodizationYear.count') do
      post periodization_years_url, params: { periodization_year: { title: @periodization_year.title } }
    end

    assert_redirected_to periodization_year_url(PeriodizationYear.last)
  end

  test "should show periodization_year" do
    get periodization_year_url(@periodization_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodization_year_url(@periodization_year)
    assert_response :success
  end

  test "should update periodization_year" do
    patch periodization_year_url(@periodization_year), params: { periodization_year: { title: @periodization_year.title } }
    assert_redirected_to periodization_year_url(@periodization_year)
  end

  test "should destroy periodization_year" do
    assert_difference('PeriodizationYear.count', -1) do
      delete periodization_year_url(@periodization_year)
    end

    assert_redirected_to periodization_years_url
  end
end
