class ArticlesController < ApplicationController

http_basic_authenticate_with name: "shubham", password: "secret", except: [:index, :show]

	def new
	  @article = current_user.articles.new
	end

	def create
	  @article = current_user.articles.new(article_params)
	  if @article.save
	  	redirect_to articles_path
	  else	
	  	render 'new'
	  end
	end

	def edit
	  @article = Article.friendly.find(params[:id])
	end

	def update	
	  @article = Article.friendly.find(params[:id])
	  if @article.user == current_user
		  if @article.update(article_params)
		    redirect_to @article
		  else
		    render 'edit'
		  end
	   else
	   		redirect_to articles_path, notice: "You are not authorize to edit that"
	   end
	end

	def destroy
		@article = Article.friendly.find(params[:id])
		if @article.user == current_user
		  @article.destroy
		  redirect_to articles_path
		else
		  redirect_to articles_path, notice: "You are not authorize to delete that"
		end
	end

	def show
	  @article = Article.friendly.find(params[:id])
	end

	def index
	  @articles = Article.all
	end

private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
