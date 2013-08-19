class AddTimestamps < ActiveRecord::Migration
  def change
    add_column :tweets, :created_at, :datetime    
    add_column :tweets, :updated_at, :datetime
    add_column :twitter_users, :created_at, :datetime
    add_column :twitter_users, :updated_at, :datetime
  end
end
