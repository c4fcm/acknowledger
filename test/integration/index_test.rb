require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest
  def test_smoke_test
    get '/'
  end
end
