require 'test_helper'

class WorkoutEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workout_entries_index_url
    assert_response :success
  end

end
