require 'test_helper'

class ProjControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "view project" do
    get(:view, {"id"=>projects(:two).id})
    assert_equal projects(:two).id, assigns[:project].id

    get(:view, {"id"=>projects(:one).id})
    assert_response :redirect
  end
end
