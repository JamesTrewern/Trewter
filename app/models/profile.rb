class Profile < ApplicationRecord
  validates :user, uniqueness: true
  validates :dob, date: {before: Proc.new {Time.now - 16.year}}
  validates :first_name, :surname, length: {minimum: 2, maximum: 20}
  validates :first_name, :surname, format: {with: /\A([A-Z][a-z\-]+)+\z/, message: "must start with capital"}
  validates :bio, length: {maximum: 300}

  has_many :posts, dependent: :destroy
  validates_associated :posts
  has_many :comments, dependent: :destroy
  validates_associated :comments
  belongs_to :user


  has_many :followersR, foreign_key: :follower_id , class_name: "Follow"
  has_many :followed, through: :followersR, class_name: "Profile"
  has_many :followedR, foreign_key: :followed_id, class_name: "Follow"
  has_many :followers, through: :followedR, class_name: "Profile"

end
