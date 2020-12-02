class UserIsOlderThan16 < ActiveModel::Validator
  def validate(record)
    yearsAgo16 = DateTime.now - 16.years
    if record.dob
      if record.dob > DateTime.now - 16.years
        record.errors[:dob] << 'age must be greater than 16'
      end
    end
  end
end

class Profile < ApplicationRecord

  validates :user, uniqueness: true
  validates_with UserIsOlderThan16

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :followers, foreign_key: :follower_id , class_name: "Follow"
  has_many :followed, through: :followers
  has_many :followed, foreign_key: :followed_id, class_name: "Follow"
  has_many :followers, through: :followed

end
