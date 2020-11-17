class Profile < ApplicationRecord
  validates :first_name, :surname, :email, :password, presence: true
  validates :email, uniqueness: true;
  validates :email, format: { with: /\A[\w.]+@\w+(.\w+)+\z/, message: "email must be correctly formatted" }
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  has_many :posts, dependent: :destroy
end
