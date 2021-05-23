require 'test_helper'

class MytweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mytweets_index_url
    assert_response :success
  end

end
