# frozen_string_literal: true

namespace :db do
  desc 'Fully reset the database and load fresh data from scratch'
  task full_reset: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    create_users
    create_posts
    create_comments
    create_likes
    create_follows
  end

  def create_users
    puts '-----------Creating Users-----------'
    5.times do |_i|
      User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: '123456')
    end
  end

  def create_posts
    puts '-----------Creating Posts-----------'
    25.times do |_i|
      Post.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs.join(' '), user: User.all.sample)
    end
  end

  def create_comments
    puts '-----------Creating Comments-----------'
    100.times do |_i|
      Comment.create!(description: Faker::Lorem.paragraphs.join(' '), user: User.all.sample, post: Post.all.sample)
    end
  end

  def create_likes
    puts '-----------Creating Likes-----------'
    500.times do |_i|
      Like.create!(user: User.all.sample, post: Post.all.sample)
    end
  end

  def create_follows
    puts '-----------Creating Follows-----------'
    following_user = User.first
    User.limit(5).offset(1).each do |user|
      Follow.create!(follower_id: user.id, following_id: following_user.id)
    end

    User.limit(5).offset(1).each do |user|
      Follow.create!(follower_id: following_user.id, following_id: user.id)
    end
  end
end
