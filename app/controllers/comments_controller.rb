class CommentsController < ApplicationController
	
http_basic_authenticate_with name: "shubham", password: "secret", only: :destroy
 
 	def create
 	   @article = Article.friendly.find(params[:article_id])
 	   @comment = @article.comments.create(comment_params)
 	   redirect_to article_path(@article)
 	end
 	def destroy
 		@article = Article.friendly.find(params[:article_id])
 		if current_user == @article.user
	 		@comment = @article.comments.find(params[:id])
	 		@comment.destroy
	    	redirect_to article_path(@article)
	    else
	    	redirect_to article_path(@article), notice: "You are not authorized to delete that comment"
	    end
 	end


 private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
