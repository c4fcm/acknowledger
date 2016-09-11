class Project < ActiveRecord::Base
  has_many :project_people
  has_many :project_hosts
  has_many :people, -> {order("project_people.order ASC")}, :through => :project_people
  has_many :hosts, -> {order("project_hosts.order ASC")}, :through => :project_hosts

  rails_admin do
    configure(:description) do
      html_attributes cols: 80, rows: 10
    end

    %i(title subtitle category uri).each do |attr|
      configure(attr) do
        html_attributes size: 80
      end
    end
    
    configure :people do
      visible(false)
    end

    configure :hosts do
      visible(false)
    end
  end

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
    Project.where(sql).order("date DESC")
  end
  
  def self.featured_projects
    sql = "category LIKE '%main%' and category LIKE '%featured%'"
    Project.where(sql).order("date DESC")
  end
end
