class AddRtToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :retweet, :integer, default: 0
  end
end
