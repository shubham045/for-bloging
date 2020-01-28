require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

	context '#index' do
		subject { get :index }

		it 'user can see all the articles' do
			user = FactoryBot.create(:user)
			sign_in user
			get :index
			expect(subject).to render_template(:index)
		end 
	end

end
