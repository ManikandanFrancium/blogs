require 'rails_helper'

RSpec.describe UsersController, type: :request do
  # let(:user) { create(:user) }
  before do
    @user = User.create(username: Faker::Name.name, email: Faker::Internet.email, password: '123456')
    @user_header = { HTTP_ACCEPT: 'application/json', Authorization: "Bearer #{@user.remember_token}" }
  end

  describe 'GET #index' do
    it 'is valid with valid attributes' do
      get users_url, headers: @user_header
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'GET #show' do
  #   let(:user) { User.create!(username: Faker::Name.first_name, email: Faker::Internet.email, password: '123456') }
  #   it 'is valid with valid attributes' do
  #     username = user.username
  #     expect(username).not_to be_nil
  #   end
  # end
end
