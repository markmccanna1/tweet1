class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text, presense: true, index: true
      t.belongs_to :twitter_user
    end
  end
end
