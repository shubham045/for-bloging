require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do

	context '#new' do
		it 'user sign_up' do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			get :new
			expect(response.successful?).to be(true)
		end 
	end

	context '#create' do
		it 'user sign_up' do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryBot.build(:user)
			get :create, params: {user: {:name => user.name, :email => user.email, :mobile => user.mobile, :password => user.password}}
			expect(response).to be_redirect
		end 
	end

end
