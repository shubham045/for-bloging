require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
	context 'create new user' do
		it 'new user can signup' do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			post :create , params: { user: {:name => "shubham", :mobile => 8896637666, :email => "test@gmail.com", :password => 123456}}
		end
	end
end
