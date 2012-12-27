class Project < ActiveRecord::Base
  has_many :project_people
  has_many :project_hosts
  has_many :people, :through => :project_people, :order=>"project_people.order ASC"
  has_many :hosts, :through => :project_hosts, :order=>"project_hosts.order ASC"

  def add_person_to_project(person, label, order=nil)
    if self.people.size == 0
      max_order = 0
    else
      max_order = self.project_people.collect{|p| p.order}.max
    end
    
    if !order.nil? and order <= max_order
      return nil
    end

    order = max_order + 1 if order.nil?
    
    ProjectPerson.create!({:project=>self, :person=>person, 
                           :label=>label, :order=>order})
  end
  
end
