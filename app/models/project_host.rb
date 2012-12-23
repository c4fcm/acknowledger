class ProjectHost < ActiveRecord::Base
  belongs_to :hosts
  belongs_to :projects
end
