class User < ApplicationRecord
  include Clearance::User
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_one_attached :post_image

  has_many :followers, foreign_key: :follower_id, class_name: 'Follow'

  # SELECT "users".* FROM "users" INNER JOIN "follows" ON "users"."id" = "follows"."follower_id" WHERE "follows"."following_id" = ?

  has_many :follower_users, through: :followers, source: :following

  has_many :followings, foreign_key: :following_id, class_name: 'Follow'

  # SELECT "users".* FROM "users" INNER JOIN "follows" ON "users"."id" = "follows"."following_id" WHERE "follows"."follower_id" = ?

  has_many :following_users, through: :followings, source: :follower
end
