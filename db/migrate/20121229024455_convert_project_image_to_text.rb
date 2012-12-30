class ConvertProjectImageToText < ActiveRecord::Migration
  def change
    change_column :projects, :image, :text
  end
end
