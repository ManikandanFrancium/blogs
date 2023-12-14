class User < ApplicationRecord
  include Clearance::User
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_one_attached :profile_picture

  has_many :followers
end
