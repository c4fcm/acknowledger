class Project < ActiveRecord::Base
  has_many :project_people
  has_many :project_hosts
  has_many :people, :through => :project_people, :order=>"project_people.order ASC"
  has_many :hosts, :through => :project_hosts, :order=>"project_hosts.order ASC"

  def add_person_to_project(person, label, order=nil)
    max_order = self.project_people.collect{|p| p.order}.max
    max_order = 0 if max_order.nil?
    return nil if !order.nil? and order <= max_order
    order = max_order + 1 if order.nil?
    
    pp = ProjectPerson.create!({:project=>self, :person=>person, 
                                :label=>label, :order=>order})
  end

  def add_host_to_project(host, label, order=nil)
    max_order = self.project_hosts.collect{|h|h.order}.max
    max_order = 0 if max_order.nil?
    return nil if !order.nil? and order <= max_order
    order = max_order + 1 if order.nil?

    ph = ProjectHost.create!({:project=>self, :host=>host,
                              :label=>label, :order=>order})
  end

  def self.featured_posts
    sql = "category LIKE '%post%' and category LIKE '%featured%'"
    Project.where(sql).order("date DESC")[0,8]
  end
  
  def self.featured_projects
    sql = "category LIKE '%main%' and category LIKE '%featured%'"
    Project.where(sql).order("date DESC")[0,4]
  end
end
