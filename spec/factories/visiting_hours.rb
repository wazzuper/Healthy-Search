FactoryBot.define do
  factory :visiting_hour do
    time Time.now
    visiting_day
  end
end
