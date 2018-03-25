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

# 50.times do
#   spec_id = rand(106..157)
#   Doctor.create(full_name: Faker::Name.name,
#                 email: Faker::Internet.safe_email,
#                 password: '123456',
#                 specialization_id: spec_id)
# end
