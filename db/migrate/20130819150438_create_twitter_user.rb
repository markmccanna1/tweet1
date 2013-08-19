class CreateTwitterUser < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :user_name, presense: true, unique: true, index: true
    end
  end
end
