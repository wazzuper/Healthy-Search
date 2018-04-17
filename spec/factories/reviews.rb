FactoryBot.define do
  factory :review do
    rating { rand(3..5) }
    comment 'Test feedback'
    patient
    doctor
    appointment
  end
end
