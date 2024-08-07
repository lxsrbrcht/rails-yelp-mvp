# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants..."
burger_king = {name: "Burger King", address: "7 Boundary St, London E2 7JE", phone_number: 53576634, category: "belgian" }
crocodile =  {name: "Crocodile", address: "56A Shoreditch High St, London E1 6PQ", phone_number: 0443264754, category: "french"}
ladress =  {name: "L'Adresse", address: "36 rue des Ploucs, Lille 59800", phone_number: 05577464, category: "french"}
traviata =  {name: "La Traviata", address: "44 chemino della pizza, Roma Pastacity", phone_number: 36889536, category: "italian" }
chiba =  {name: "Chiba", address: "56 rue Gambetta, Lille 59000", phone_number: 2743787476, category: "chinese"}


[burger_king, crocodile, ladress, traviata, chiba].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Creating reviews"

Restaurant.all.each do |restaurant|
  5.times do
    Review.create!(rating: rand(1..5), content: Faker::Lorem.paragraph, restaurant: restaurant)
  end
end
puts "Finished!"
