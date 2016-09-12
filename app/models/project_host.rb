class ProjectHost < ActiveRecord::Base
  belongs_to :host
  belongs_to :project

  rails_admin do
    object_label_method :admin_description
    configure :project do
      hide
    end   
  end

  def admin_description
    "#{host.name} (#{label})"
  end
end
