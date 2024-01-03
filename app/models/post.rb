class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :post_image
  has_paper_trail
  # accepts_nested_attributes_for :comments
  validates :title, :description, presence: true

  def increment_likes
    update(likes: likes + 1)
  end

  def diff_between_versions(body, version1, version2)
    text1 = version1&.reify&.send(body) || ''
    text2 = version2&.reify&.send(body) || ''
    Diffy::Diff.new(text1, text2).to_s(:html)
  end
end
