require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
	context 'create new user' do
		it 'new user can signup' do
			gets "/users/sign_up"
			binding.pry 
			# fill_in 'user[name]', :with => "shubham"
			# email = "abcd@example.com"    
			# fill_in 'user[email]', :with => email    
			# fill_in 'user[mobile]', :with => 8889661955    
			# fill_in 'user[password]', :with => 123456    
			# fill_in 'user[password_confirmation]', :with => 123456    
			# click_button 'Sign up'   
			# expect(page).to have_content "Welcome!" 
		end
	end
end
