class ProjectPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :project, inverse_of: :project_people

  rails_admin do
    object_label_method :admin_description
    configure :project do
      hide
    end    
  end

  def admin_description
    "#{person.name} (#{label})"
  end

end
