class Person < ActiveRecord::Base
  has_many :project_people
  has_many :projects, :through=>:project_people

  #note: we leave out hosts in this calculation
  def unique_collaborators
    #id: {:person=>person, :count=>
    collabs = {}
    self.projects.each do |project|
      project.project_people.each do |project_person|
        if collabs.has_key? project_person.person.id 
          collabs[project_person.person.id] << project_person
        else  
          collabs[project_person.person.id] = []
          collabs[project_person.person.id] << project_person
        end
      end
    end
    collabs.delete(self.id)
    collabs
  end
  def bigger_avatar
    return self.avatar.gsub("normal", "bigger") if !self.avatar.nil?
    return nil
  end   
end
