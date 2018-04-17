FactoryBot.define do
  factory :patient do
    full_name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    password 'secure!@#123'
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
