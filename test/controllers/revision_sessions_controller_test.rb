require 'test_helper'

class RevisionSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revision_sessions_index_url
    assert_response :success
  end

end
