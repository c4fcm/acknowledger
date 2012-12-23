class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :uri
      t.string :avatar
      t.timestamps
    end
  end
end
