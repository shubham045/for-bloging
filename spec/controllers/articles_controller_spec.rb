require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	
	def create_article
		@article = FactoryBot.create(:article, user_id: @user.id)
	end

	before :each do	
		@user = FactoryBot.create(:user)
		sign_in @user
	end	

	describe '#new' do
		it 'create object of article' do
			get :new
		end 
	end

	describe '#create' do
		it 'create article for user' do
			@article = FactoryBot.build(:article, user_id: @user.id)
			post :create, params: {article: {:title => @article.title, :text => @article.text}}
			expect(response).to be_redirect
		end 
	end

	describe '#edit' do
		it 'user can edit their article' do
			create_article
			get :edit, params: {id: @article.id}
		end 
	end

	describe '#update' do
		it 'user can update their article' do
			create_article
			put :update, params: {id: @article.id, article: {:title => @article.title, :text => @article.text}}
			expect(response).to be_redirect
		end 
	end

	describe '#delete' do
		it 'user can delete their article' do
			create_article
			delete :destroy, params: {id: @article.id}
			expect(response).to be_redirect
		end 
	end

	describe '#index' do
		it 'user can see all the articles' do
			get :index
			expect(response.successful?).to be(true)
		end 
	end

	describe '#show' do
		it 'user can see all the articles' do
			create_article
			get :show, params: {id: @article.id}
			expect(response.successful?).to be(true)
		end 
	end

end
