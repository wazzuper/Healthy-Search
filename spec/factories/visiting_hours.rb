FactoryBot.define do
  factory :visiting_hour do
    sequence(:time) { |n| Time.now + n * 3600 }
    visiting_day
  end
end
