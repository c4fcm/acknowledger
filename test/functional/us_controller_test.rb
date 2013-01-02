require 'test_helper'

class UsControllerTest < ActionController::TestCase
  test "the truth" do
    get(:person, {"id"=>people(:one).id})
    assert_equal people(:one).id, assigns[:person].id
  end
end
