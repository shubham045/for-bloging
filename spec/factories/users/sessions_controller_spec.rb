FactoryBot.define do
  factory :user do
  	name { Faker::Name.name  }
    email { Faker::Internet.email }
    mobile { Faker::PhoneNumber.cell_phone }
    password { 123456 }
  end
end