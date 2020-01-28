require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	
	before :each do
  	@user = FactoryBot.create(:user)
		sign_in @user
		@article = FactoryBot.create(:article, user_id: @user.id)
		@comment = FactoryBot.create(:comment, article_id: @article.id)
	end

	context '#create' do
		it 'create comment on article' do
			post :create, params: {:article_id => @article.id, comment: {:commenter => @comment.commenter, :text => @comment.body}}
			expect(response).to be_redirect
		end 
	end

	context '#destroy' do
		it 'user can delete their comment' do
			delete :destroy, params: {:article_id => @article.id, :id => @comment.id}
			expect(response).to be_redirect
		end 
	end
	
end
