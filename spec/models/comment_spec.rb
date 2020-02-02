require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "user association" do
    it "article should have one user" do
    	comment = Comment.new
    	article = Article.new
    	article.comments << comment
      expect(article.comments.first).to be comment
    end
  end
  
end
