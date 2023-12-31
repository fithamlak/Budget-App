require 'rails_helper'

describe 'Categories ', type: :request do
  describe 'GET /index' do
    context 'when user is not signed in' do
      it 'redirects to the sign-in page' do
        get categories_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      let(:user) do
        User.create(
          name: 'Justice',
          email: "#{Faker::Name.first_name}@try.com",
          password: 'password',
          password_confirmation: 'password'
        )
      end

      before do
        sign_in user
      end

      it 'renders the index template' do
        get categories_path
        expect(response).to render_template(:index)
      end
    end
  end
end
