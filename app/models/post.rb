class Post < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  belongs_to :profile
  has_many :comments, dependent: :destroy
  scope :followed, ->(user) {
    followedProfiles = user.profile.followed
    where(:profile => followedProfiles)}
  scope :feed, ->(user) {
    Post.followed(user) + user.profile.posts
   }
   scope :search, ->(query) {
     Post.where("title like ?","%#{query}%") + Post.where("post_text like ?","%#{query}%")
   }
end
