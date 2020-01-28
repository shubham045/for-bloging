require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    context "user association" do
      it "should have many articles" do
        t = User.reflect_on_association(:articles)
        expect(t.macro).to eq(:has_many)
      end
    end
  end

  context 'validation test' do
  	it "ensure name presence" do
  		user = User.new(mobile: 889661955, email: "test@gmail.com", password: 123456).save
  		expect(user).to eq(false)
  	end

  	it "ensure email presence" do
  		user = User.new(name: "shubham", mobile: 889661955, password: 123456).save
  		expect(user).to eq(false)
  	end

  	it "ensure mobile presence" do
  		user = User.new(name: "shubham", email: "test@gmail.com", password: 123456).save
  		expect(user).to eq(false)
  	end
  end
  
end
