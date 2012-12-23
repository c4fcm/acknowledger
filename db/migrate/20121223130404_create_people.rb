class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :uri
      t.string :avatar

      t.timestamps
    end
  end
end
