require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	
	context 'post #create' do
		it 'create article for user' do
			user = FactoryBot.create(:user)
			sign_in user
			article = FactoryBot.create(:article, user_id: user.id)
			post :create, params: {article: {:title => article.title, :text => article.text}}
			expect(response).to be_redirect
		end 
	end

	# context '#edit' do
	# 	it 'user can edit their article' do
	# 		user = FactoryBot.create(:user)
	# 		sign_in user
	# 		article = FactoryBot.create(:article, user_id: user.id)
	# 		put :update, params: {article: {:title => article.title, :text => article.text}}
	# 	end 
	# end

	context 'get #index' do
		it 'user can see all the articles' do
			user = FactoryBot.create(:user)
			sign_in user
			get :index
			expect(response.successful?).to be(true)
		end 
	end

end
