class ArticlesController < ApplicationController


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

	# def otp_verification
	# 	binding.pry
	# end

	def edit
	  @article = Article.friendly.find(params[:id])
	end

	def update
	  @article = Article.friendly.find(params[:id])
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @article = Article.friendly.find(params[:id])
	  @article.destroy
	  redirect_to articles_path
	end

	def show
	  @article = Article.friendly.find(params[:id])
	end

	def index
	  @articles = Article.all
	end

 private

  def article_params
    params.require(:article).permit(:title, :text, :otp)
  end

end
