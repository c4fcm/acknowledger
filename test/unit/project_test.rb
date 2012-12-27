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

  test "add host to project" do
    assert_equal 2, projects(:one).hosts.size
    medialab = Host.create!({:name=>"MIT Media Lab", :twitter_account=>"medialab",
                            :uri=>"https://twitter.com/medialab"})
    #this should fail, since something else has order one
    projects(:one).add_host_to_project(medialab, "supporter", 1)

    projects(:one).reload
    assert_equal 2, projects(:one).hosts.size
    assert_equal 2, projects(:one).project_hosts.size

    #this should succeed and assign the order as 3
    projects(:one).add_host_to_project(medialab, "contributor")
    projects(:one).reload
    assert_equal 3, projects(:one).hosts.size
    assert_equal 3, projects(:one).project_hosts.size
    assert_equal 3, projects(:one).project_hosts.last.order
  end
end
