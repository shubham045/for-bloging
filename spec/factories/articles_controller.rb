FactoryBot.define do
  factory :article do
  	title { Faker::Lorem.word  }
    text { Faker::Lorem.sentence }
  end
end