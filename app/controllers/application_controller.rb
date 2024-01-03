class ApplicationController < ActionController::Base
  include Clearance::Controller

  def after_sign_in_path_for(_resource)
    posts_path # Adjust this line based on your Devise routes customization
  end
end
