class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.string :category
      t.string :uri
      t.string :image
      t.datetime :date
      t.datetime :end_date

      t.timestamps
    end
  end
end
