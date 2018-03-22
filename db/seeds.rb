# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page1 = Nokogiri::HTML(open('https://www.jmu.edu/esol/specialist_list.htm'))
cells1 = page1.css('b')[1]

#puts cells1

page2 = Nokogiri::HTML(open('http://www.md-health.com/types-of-doctors.html'))
cells2 = page2.css('strong')

puts cells2
