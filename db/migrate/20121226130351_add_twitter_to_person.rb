class AddTwitterToPerson < ActiveRecord::Migration
  def change
    add_column :people, :twitter_account, :string
    add_column :people, :twitter_data, :text
  end
end
