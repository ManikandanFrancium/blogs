require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'renders the index template' do
      sign_in_as(user)
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end

  # context 'when the user is not signed in' do
  #   it 'redirects to the sign-in page' do
  #     binding.pry
  #     get :index
  #     expect(response).to redirect_to(sign_in_path)
  #   end
  # end

  # describe 'GET #new' do
  #   it 'renders the new template' do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end

  # describe 'POST #create' do
  #   context 'with valid parameters' do
  #     it 'creates a new user' do
  #       expect {
  #         post :create, params: { user: attributes_for(:user) }
  #       }.to change(User, :count).by(1)
  #     end

  #     it 'redirects to the root path' do
  #       post :create, params: { user: attributes_for(:user) }
  #       expect(response).to redirect_to(root_path)
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new user' do
  #       expect {
  #         post :create, params: { user: attributes_for(:user, email: nil) }
  #       }.not_to change(User, :count)
  #     end

  #     it 'renders the new template' do
  #       post :create, params: { user: attributes_for(:user, email: nil) }
  #       expect(response).to render_template(:new)
  #     end
  #   end
  # end

  # describe 'GET #show' do
  #   context 'when the user is signed in' do
  #     let(:user) { create(:user) }

  #     before do
  #       sign_in_as(user)
  #     end

  #     it 'renders the show template' do
  #       get :show, params: { id: user.id }
  #       expect(response).to render_template(:show)
  #     end
  #   end

  #   context 'when the user is not signed in' do
  #     it 'redirects to the sign-in page' do
  #       get :show, params: { id: 1 }
  #       expect(response).to redirect_to(sign_in_path)
  #     end
  #   end
  # end
end
