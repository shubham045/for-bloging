require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
	context 'user sign_in' do
		it 'new user can sign_in' do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			post :create, xhr: true
			user = FactoryBot.create(:user)	
			sign_in user
		end
	end
end
