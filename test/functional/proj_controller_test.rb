require 'test_helper'

class ProjControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "view project" do
    get(:view, {"id"=>projects(:one).id})
    assert_equal projects(:one).id, assigns[:project].id
  end
end
