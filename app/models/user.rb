class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  scope :tweets_for_me, -> (following_friends) { where user_id: following_friends }

  
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friends, class_name: "Friend", dependent: :destroy

  def get_name
    self.user_name
  end

  

  paginates_per 10
end
