class ProjectPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :project

  rails_admin do
    object_label_method :admin_description
  end

  def admin_description
    "#{person.name} (#{label})"
  end

end
