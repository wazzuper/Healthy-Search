FactoryBot.define do
  factory :doctor do
    full_name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    password 'secure!@#123'
    specialization
    experience { rand(1..45) }
    bio 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    price { rand(15..50) }
    phone_number { Faker::PhoneNumber.phone_number }
    address
    active true
  end
end
