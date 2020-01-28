require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	
	before :each do
  	@user = FactoryBot.create(:user)
		sign_in @user
		@article = FactoryBot.create(:article, user_id: @user.id)
	end

	context '#create' do
		it 'create article for user' do
			user = FactoryBot.create(:user)
			sign_in user
			get :new
		end 
	end

	context '#create' do
		it 'create article for user' do
			post :create, params: {article: {:title => @article.title, :text => @article.text}}
			expect(response).to be_redirect
		end 
	end

	context '#edit' do
		it 'user can edit their article' do
			get :edit, params: {id: @article.id}
		end 
	end

	context '#update' do
		it 'user can update their article' do
			put :update, params: {id: @article.id, article: {:title => @article.title, :text => @article.text}}
			expect(response).to be_redirect
		end 
	end

	context '#delete' do
		it 'user can delete their article' do
			delete :destroy, params: {id: @article.id}
			expect(response).to be_redirect
		end 
	end

	context '#index' do
		it 'user can see all the articles' do
			user = FactoryBot.create(:user)
			sign_in user
			get :index
			expect(response.successful?).to be(true)
		end 
	end

	context '#show' do
		it 'user can see all the articles' do
			get :show, params: {id: @article.id}
			expect(response.successful?).to be(true)
		end 
	end

end
