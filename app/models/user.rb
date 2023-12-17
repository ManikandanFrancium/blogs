class User < ApplicationRecord
  include Clearance::User
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_one_attached :profile_picture

  has_many :followers, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, foreign_key: :following_id, class_name: 'Follow'
end
