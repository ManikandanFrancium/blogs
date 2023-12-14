class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # accepts_nested_attributes_for :comments
  validates :title, :description, presence: true

  def increment_likes
    update(likes: likes + 1)
  end
end
