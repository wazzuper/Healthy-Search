FactoryBot.define do
  factory :visiting_hour do
    time Time.now
    doctor
  end
end
