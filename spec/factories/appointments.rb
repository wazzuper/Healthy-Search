FactoryBot.define do
  factory :appointment do
    doctor
    patient
    visiting_day
    visiting_hour
    date Date.today
  end
end
