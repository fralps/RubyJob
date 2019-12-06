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

User.destroy_all
Ad.destroy_all

10.times do 

	user = User.create!(
		company: Faker::Company.name,
		email: Faker::Internet.email,
		password: Faker::Internet.password)

	# Puts to show every time an user is created
		puts "User created".green
end

20.times do
	ad = Ad.create!(
		title: ["Développeur Fullstack Ruby On Rails", "Développeur Web Ruby On Rails", "Développeur Backend Ruby"].sample,
		job_description: Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false),
		profile_description: Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false),
		salary: rand(1800..3000),
		location: Faker::Address.city,
		contract: ["CDI", "CDD", "Freelance", "Stage", "Alternance"].sample,
		email: Faker::Internet.email,
		experience: ["Très junior", "Junior", "Sénior"].sample,
		user_id: rand(1..10),
		image_url: ["https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1952&q=80", "https://images.unsplash.com/photo-1555099962-4199c345e5dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1545670723-196ed0954986?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80", "https://images.unsplash.com/photo-1531482615713-2afd69097998?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"].sample)

	# Puts to show every time an item is added
	puts "Ad added".blue
end

# We create the super user
user = User.create!(
		company: Faker::Company.name,
		email: "admin@yopmail.com",
		password: "admin1234",
		is_admin: true)

puts "-----------------------------".green
puts "------- Admin created! ------".green
puts "-----------------------------".green

puts "Access to the admin account :".green
puts "Login: admin@yopmail.com".green
puts "Password: admin1234".green
puts "-----------------------------".green