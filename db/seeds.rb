# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Colorize just for fun
require 'colorize'

# Faker gem
require 'faker'

# To limit the database entries
# each time we seed we delete the previous ones and we reset database's ids
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

User.destroy_all
Ad.destroy_all

20.times do 

	user = User.create!(
		company: Faker::Company.name,
		email: Faker::Internet.email,
		password: Faker::Internet.password)

	# Puts to show every time an user is created
		puts "User created".green
end

10.times do
	ad = Ad.create!(
		title: ["Développeur Fullstack Ruby On Rails", "Développeur Web Ruby On Rails", "Développeur Backend Ruby"].sample,
		job_description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),
		profile_description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),
		salary: rand(1800..3000),
		location: Faker::Address.city,
		contract: Faker::Job.employment_type,
		email: Faker::Internet.email,
		experience: Faker::Job.seniority,
		user_id: rand(1..20))

	# Puts to show every time an item is added
	puts "Ad added".blue
end

# We create the super user
user = User.create!(
		company: Faker::Company.name,
		email: "admin@yopmail.com",
		password: "dumdum")

puts "-----------------------------".green
puts "------- Admin created! ------".green
puts "-----------------------------".green

puts "Access to the admin account :".green
puts "Login: admin@yopmail.com".green
puts "Password: dumdum".green
puts "-----------------------------".green