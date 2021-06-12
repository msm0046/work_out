require 'test_helper'

class ChildrenWorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get children_workouts_index_url
    assert_response :success
  end

end
