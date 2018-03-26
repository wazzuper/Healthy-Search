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

200.times do
  spec_id = rand(106..157)
  exp = rand(1..45)
  price = rand(15..30) if exp >= 1 || exp < 5
  price = rand(25..45) if exp >= 5 || exp < 15
  price = rand(40..60) if exp >= 15 || exp < 30
  price = rand(55..80) if exp >= 30 || exp <= 45

  Doctor.create(full_name: Faker::Name.name,
                email: Faker::Internet.safe_email,
                password: '123456',
                specialization_id: spec_id,
                experience: exp,
                price: price,
                phone_number: Faker::PhoneNumber.cell_phone)
end
