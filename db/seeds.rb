# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database (users, surfboards, reviews, bookings)...'

User.destroy_all
Surfboard.destroy_all
Review.destroy_all
Booking.destroy_all

puts 'Creating new user'

25.times do
  puts 'Creating another user'

  user_attributes = {
    username: "@#{Faker::FunnyName.name.gsub(" ", "").downcase}",
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
  }

  new_user = User.new(user_attributes)

  new_user.save!

end

puts 'Creating new board'

25.times do

  puts 'Creating another surfboard'

  brands = ['channel islands', 'lost', 'catch surf', 'south bay', 'firewire', 'pyzel']
  board_types = ['long board', 'short board', 'soft top']
  fin_types = ['single fin', 'twin fin', 'thruster fin', 'quad fin']
  description = ['cooler than your mom','great for tiny waves', 'super sick', 'kinda sick']

  surfboard_attributes = {
    board_type: board_types.sample,
    length: (60..119).to_a.sample,
    volume: (20..80).to_a.sample,
    price_per_day: (5..50).to_a.sample,
    fin_type:fin_types.sample,
    brand: brands.sample,
    description: description.sample,
    name: "@#{Faker::FunnyName.name.gsub(" ", "").downcase}"
  }

  new_board = Surfboard.new(surfboard_attributes)
  new_board.user = User.all.sample

  new_board.save!


end


puts 'Creating new booking'

25.times do

  puts 'Creating another booking'

  booking_attributes = {
    collection_date: Date.today + (0..5).to_a.sample,
    return_date: Date.today + (6..20).to_a.sample
  }

  new_booking = Booking.new(booking_attributes)
  new_booking.user = User.all.sample
  new_booking.surfboard = Surfboard.all.sample
  new_booking.price_per_day = new_booking.surfboard.price_per_day

  new_booking.save!


end


puts 'Creating new review'

25.times do

  puts 'Creating another review'

  comments = ['was cooler than my mom','was great for tiny waves', 'super sick i guess', 'kinda sick in a bad way', 'i almost died']

  review_attributes = {
    rating: (0..5).to_a.sample,
    comment: comments.sample
  }

  new_review = Review.new(review_attributes)
  new_review.user = User.all.sample
  new_review.booking = Booking.all.sample

  new_review.save!


end

puts 'Finished seeding :)'
