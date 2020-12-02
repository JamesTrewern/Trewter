class Profile < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :followers, foreign_key: :follower_id , class_name: "Follow"
  has_many :followed, through: :followers
  has_many :followed, foreign_key: :followed_id, class_name: "Follow"
  has_many :followers, through: :followed

end
