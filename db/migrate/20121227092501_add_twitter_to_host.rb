class AddTwitterToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :twitter_account, :string
    add_column :hosts, :twitter_data, :text
  end
end
