class CreateProjectHosts < ActiveRecord::Migration
  def change
    create_table :project_hosts do |t|
      t.integer :project_id, :null=>false
      t.integer :host_id, :null=>false
      t.integer :order
      t.string  :label
      t.timestamps
    end
  end
end
