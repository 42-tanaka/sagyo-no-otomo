require "test_helper"

class RandomPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get random_posts_index_url
    assert_response :success
  end
end
