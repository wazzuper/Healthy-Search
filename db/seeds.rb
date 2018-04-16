require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Doctors specializations
# page = Nokogiri::HTML(open('http://www.md-health.com/types-of-doctors.html'))
# words = page.css('strong')
# words.delete(words.last)

# words.each do |word|
#   word_to_arr = word.text.split('-')
#   word = word_to_arr[0].strip
#   Specialization.create(name: word)
# end

# Create 200 doctors with random parameters
# 200.times do
#   spec_id = rand(1..Specialization.all.count)
#   exp = rand(1..45)
#   if exp >= 1 && exp < 5
#     price = rand(15..30)
#   elsif exp >= 5 && exp < 15
#     price = rand(25..45)
#   elsif exp >= 15 && exp < 30
#     price = rand(40..60)
#   else
#     price = rand(55..80)
#   end

#   d = Doctor.create(full_name: Faker::Name.name,
#                 email: Faker::Internet.safe_email,
#                 password: '123456',
#                 specialization_id: spec_id,
#                 experience: exp,
#                 bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
#                 price: price,
#                 phone_number: Faker::PhoneNumber.phone_number)

#   a = Address.create(place: '12629 Riverside Drive, North Hollywood', doctor_id: d.id)
#   d.address = a
#   d.active = true

#   v = VisitingDay.create(date: Date.today, doctor_id: d.id)
#   VisitingHour.create(time: Time.now, visiting_day_id: v.id)

#   d.save
# end

# Patient for testing
# Patient.create(full_name: Faker::Name.name,
#   email: Faker::Internet.safe_email,
#   password: '123456',
#   phone_number: Faker::PhoneNumber.phone_number)

# Review with random rating
# Doctor.all.each do |doctor|
#   v = VisitingDay.create(date: Date.today, doctor_id: doctor.id)
#   VisitingHour.create(time: Time.now, visiting_day_id: v.id)

#   Appointment.create(doctor_id: doctor.id, patient_id: Patient.first.id,
#     visiting_day_id: doctor.visiting_days.first.id, visiting_hour_id: doctor.visiting_days.first.visiting_hours.first.id,
#     date: doctor.visiting_days.first.date)
# end

# Appointment.all.each do |a|
#   Review.create(rating: rand(1..5), comment: 'Random comment and rating', patient_id: a.patient_id, doctor_id: a.doctor_id,
#     appointment_id: a.id)
# end

# Visiting hours and days
Doctor.all.each do |doctor|
  count = 0

  7.times do
    v = VisitingDay.create(date: Date.today + count, doctor_id: doctor.id)
    VisitingHour.create(time: '09:00', visiting_day_id: v.id)
    VisitingHour.create(time: '10:00', visiting_day_id: v.id)
    VisitingHour.create(time: '11:00', visiting_day_id: v.id)
    VisitingHour.create(time: '12:00', visiting_day_id: v.id)
    VisitingHour.create(time: '13:00', visiting_day_id: v.id)
    count += 1
  end
end
