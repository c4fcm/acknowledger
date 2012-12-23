class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :uri
      t.string :avatar

      t.timestamps
    end
  end
end
