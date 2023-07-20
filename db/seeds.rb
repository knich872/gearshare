# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# puts "Cleaning database..."
# User.destroy_all

# puts "Creating Users..."

# 10.times do
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: "0123456"
#   )
#   puts "User with id :#{user.id} has been created"
# end
# puts "Finished!"

puts "Cleaning database..."
Product.destroy_all

puts "Creating Products..."

20.times do
  product = Product.create!(
    name: "Camera"
    description: "A camera is an optical instrument used to capture and store images or videos, either digitally via an electronic image sensor, or chemically via a light-sensitive material such as photographic film. As a pivotal technology in the fields of photography and videography,",
  　rental_price_day: "2",
    category:  ["cameras" ,"clothe", "appliances", "jewelry", "sports", "outdoors", "events", "transportation" ,"tools", "baby" ]
  )
  puts "Product with id :#{product.id} has been created"

end

puts "Finished!"
