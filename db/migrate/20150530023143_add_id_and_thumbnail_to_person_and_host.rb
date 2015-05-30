class AddIdAndThumbnailToPersonAndHost < ActiveRecord::Migration
  def change
      add_column :people, :twitter_id, :int
      add_column :hosts, :twitter_id, :int
  end
end
