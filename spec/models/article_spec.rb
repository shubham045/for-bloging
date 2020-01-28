require 'rails_helper'

RSpec.describe Article, type: :model do

    context "user association" do
      it "should have one user" do
        t = User.reflect_on_association(:user)
        binding.pry
        expect(t.macro).to eq(:belongs_to)
      end
    end
  
	# context 'validation test' do
 #  	it "ensure title presence" do
 #  		article = Article.new(text: "something is inter.....").save
 #  		expect(article).to be(false)
 #  	end
 #  end

 #  context 'validation test' do
 #  	it "ensure text presence" do
 #  		article = Article.new(title: "new title").save
 #  		expect(article).to be(false)
 #  	end
 #  end

end
