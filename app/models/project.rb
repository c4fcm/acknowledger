class Project < ActiveRecord::Base
  has_many :project_people
  has_many :project_hosts
  has_many :people, :through => :project_person
  has_many :hosts, :through => :project_host
end
