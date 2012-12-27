class ProjectHost < ActiveRecord::Base
  belongs_to :host
  belongs_to :project
end
