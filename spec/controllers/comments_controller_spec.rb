require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	
	before :each do
  	@user = FactoryBot.create(:user)
		sign_in @user
	end

	def create_article
		@article = FactoryBot.create(:article, user_id: @user.id)
	end

	describe '#create' do
		it 'create comment on article' do
			create_article
			@comment = FactoryBot.build(:comment, article_id: @article.id)
			post :create, params: {:article_id => @article.id, comment: {:commenter => @comment.commenter, :text => @comment.body}}
			expect(response).to be_redirect
		end 
	end

	describe '#destroy' do
		it 'user can delete their comment' do
			create_article
			@comment = FactoryBot.create(:comment, article_id: @article.id)
			delete :destroy, params: {:article_id => @article.id, :id => @comment.id}
			expect(response).to be_redirect
		end 
	end
	
end
