require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	
	context 'GET #create' do
		it 'create article for user' do
			post :create, params: { user: {:name => "shubham", :mobile => 8896637666, :email => "test@gmail.com", :password => 123456}}
		end 
	end

end
