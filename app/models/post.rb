class Post < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  belongs_to :profile
  has_many :comments, dependent: :destroy
  scope :followed, ->(user) {
    followedProfiles = user.profile.followed
    where(:profile => followedProfiles)}
end
