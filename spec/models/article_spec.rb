require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "user association" do
    it "article should have one user" do
      article = Article.new
      user = User.new
      user.articles << article
      expect(article.user).to be user
    end
  end

  describe "article association" do
    it "article should have many comments" do
      t = Article.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end
  end

  describe "dependent destroy" do
    it "when delete article then all the associated commets destroy" do
      user = FactoryBot.create(:user)
      article = FactoryBot.create(:article, :user_id => user.id)
      comment1  = FactoryBot.create(:comment, :article_id => article.id)
      comment2  = FactoryBot.create(:comment, :article_id => article.id)
      expect { article.destroy }.to change(Comment, :count).by(-2)
    end  
  end
  
	describe 'validation test' do
  	it "ensure title presence" do
  		article = Article.new(text: "something is inter.....").save
  		expect(article).to be(false)
  	end
  end

  describe 'validation test' do
  	it "ensure text presence" do
  		article = Article.new(title: "new title").save
  		expect(article).to be(false)
  	end
  end

end
