class SessionsController < ApplicationController
  def create
    binding.pry
  end

  private

  def url_after_create
    posts_path # Adjust this line to customize the redirection path
  end
end
