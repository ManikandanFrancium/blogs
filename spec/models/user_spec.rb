require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end

  describe 'validations' do
    let(:user) { User.create!(username: Faker::Name.first_name, email: Faker::Internet.email, password: '123456') }
    it 'is valid with valid attributes' do
      username = user.username
      expect(username).not_to be_nil
    end

    # it 'is not valid without a name' do
    #   user = build(:user, name: nil)
    #   expect(user).to_not be_valid
    # end

    # Add more validation tests as needed
  end

  # describe 'associations' do
  #   it 'has many posts' do
  #     association = described_class.reflect_on_association(:posts)
  #     expect(association.macro).to eq :has_many
  #   end

  #   # Add more association tests as needed
  # end

  # describe 'instance methods' do
  #   it 'returns the username' do
  #     user = build(:user, username: 'Gov. Lucile Lebsack')
  #     expect(user.username).to eq 'Gov. Lucile Lebsack'
  #   end

  #   # Add more instance method tests as needed
  # end
end
