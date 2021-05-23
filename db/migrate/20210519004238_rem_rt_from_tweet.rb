class RemRtFromTweet < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :retweet, :integer
  end
end
