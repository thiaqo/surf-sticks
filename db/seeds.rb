# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database...'

User.destroy_all
Surfboard.destroy_all

puts 'Creating new user'

50.times do

  user_attributes = {
    username: "@#{Faker::FunnyName.name.gsub(" ", "").downcase}",
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
  }

  new_user = User.new(user_attributes)

  new_user.save!

  puts 'Creating another user'
end

puts 'Creating new board'

50.times do

  brands = ['channel islands', 'lost', 'catch surf', 'south bay', 'firewire', 'pyzel']
  board_types = ['long board', 'short board', 'potato board', 'soft top']
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
  }

  new_board = Surfboard.new(surfboard_attributes)
  new_board.user = User.all.sample

  new_board.save!

  puts 'Creating another surfboard'
end

puts 'Finished seeding :)'

# validates :username, :name, :email, presence: true

# validates :length, :volume, :price_per_day, presence: true, numericality: { only_integer: true }
# validates :board_type, :fin_type, :brand, :description, presence: true
