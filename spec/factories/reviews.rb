FactoryBot.define do
  factory :review do
    rating { rand(1..5) }
    comment 'Test feedback'
    patient
    doctor
    appointment
  end
end
