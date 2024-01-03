require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) { User.create!(username: Faker::Name.first_name, email: Faker::Internet.email, password: '123456') }
    it 'is valid with valid attributes' do
      username = user.username
      expect(username).not_to be_nil
    end
  end
end
