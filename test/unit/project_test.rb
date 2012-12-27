require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "add person to project" do
    assert_equal 2, projects(:one).people.size
    ethan = Person.create!({:name=>"Ethan Zuckerman", :twitter_account=>"ethanz", 
                            :uri=>"https://twitter.com/ethanz"})
    #this should fail, since something else has order one
    projects(:one).add_person_to_project(ethan, "contributor", 1)

    projects(:one).reload
    assert_equal 2, projects(:one).people.size
    assert_equal 2, projects(:one).project_people.size

    #this should succeed and assign the order as 3
    projects(:one).add_person_to_project(ethan, "contributor")
    projects(:one).reload
    assert_equal 3, projects(:one).people.size
    assert_equal 3, projects(:one).project_people.size
    assert_equal 3, projects(:one).project_people.last.order
  end
end
