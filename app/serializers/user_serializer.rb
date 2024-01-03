class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :id

  #   def formatted_created_at
  #     object.created_at.strftime('%Y-%m-%d %H:%M:%S')
  #   end
end
