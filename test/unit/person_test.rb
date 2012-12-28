require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "test unique_collaborators" do
    person = people(:one)
    assert_equal 1, person.unique_collaborators.size

    ethan = Person.create!({:name=>"Ethan Zuckerman", :twitter_account=>"ethanz",
                            :uri=>"https://twitter.com/ethanz"})
    ethan.save
    assert_equal 2, person.projects[0].people.size
    assert_equal 2, person.projects[0].project_people.size

    person.projects[0].add_person_to_project(ethan, "contributor", 3)
    project = person.projects[0]
    project.reload
    assert_equal 3, project.people.size
    assert_equal 3, project.project_people.size
    assert_equal 2, person.unique_collaborators.size

    projects(:two).add_person_to_project(people(:one), "")
    projects(:two).add_person_to_project(people(:two), "")
    projects(:two).add_person_to_project(ethan, "")
    person.reload

    collabs = person.unique_collaborators
    assert_equal 2, collabs[people(:two).id].size
  end
end
