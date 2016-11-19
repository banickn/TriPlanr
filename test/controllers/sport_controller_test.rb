require 'test_helper'

class SportControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get sport_name:string_url
    assert_response :success
  end

end
