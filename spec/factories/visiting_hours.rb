FactoryBot.define do
  factory :visiting_hour do
    time do
      time = Time.now
      time = Time.now + 3600 if VisitingHour.exists?(time: time)
      time
    end
    visiting_day
  end
end
