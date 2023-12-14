class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description

  attribute :user do |post|
    post.user
  end
end
