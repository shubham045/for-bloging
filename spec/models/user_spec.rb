require 'rails_helper'

RSpec.describe User, type: :model do
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

  	it "should save successfully" do
  		user = User.new(name: "shubham", mobile: 8896637666, email: "test@gmail.com", password: 123456).save
  		expect(user).to eq(true)
  	end
  end
end
