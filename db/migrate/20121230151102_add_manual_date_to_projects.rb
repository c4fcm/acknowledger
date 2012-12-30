class AddManualDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :manual_date, :string
  end
end
