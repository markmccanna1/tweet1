class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
  validates_uniqueness_of :user_name
  validates_presence_of :user_name

  after_create :get_recent_tweets
  after_find :get_recent_tweets

  def get_recent_tweets
    if self.tweets == [] || self.updated_at < Time.now - (15 * 60)
      TwitterHelper.getClient.user_timeline(user_name, exclude_replies: true, count: 10).each do |tweet|
        self.tweets.find_or_create_by(text: tweet.text)
      end
    end
  end
end
