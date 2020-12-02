class FollowerNotFollowed < ActiveModel::Validator
  def validate(record)
    if record.followed == record.follower
      record.errors[:followed] << 'can not be the same as follower'
      record.errors[:follower] << 'can not be the same as followed'
    end
  end
end

class Follow < ApplicationRecord
  belongs_to :follower, class_name: "Profile"
  belongs_to :followed, class_name: "Profile"
  validates_with FollowerNotFollowed

end
