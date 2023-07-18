# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
User.destroy_all

puts "Creating Users..."

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "0123456"
  )
  puts "User with id :#{user.id} has been created"
end
puts "Finished!"

# puts "Cleaning database..."
# Product.destroy_all

# puts "Creating Products..."

# 20.times do
#   product = Product.create!(
#     name: Faker::Internet.email,
#     description: Faker::Internet.password
#     rental_price_day:
#     category:
#   )
#   puts "Product with id :#{product.id} has been created"

# end
# puts "Finished!"
