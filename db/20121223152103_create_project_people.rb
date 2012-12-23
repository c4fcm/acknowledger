class CreateProjectPeople < ActiveRecord::Migration
  def change
    create_table :project_people do |t|
      t.integer :project_id, :null=>false
      t.integer :person_id, :null=>false
      t.integer :order
      t.string  :label
      t.timestamps
    end
  end
end
