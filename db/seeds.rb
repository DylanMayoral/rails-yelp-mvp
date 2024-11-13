# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Clear existing records to avoid duplicates
Restaurant.destroy_all

# Define the list of restaurants to seed
restaurants = [
  { name: "Sakura Sushi", address: "123 Tokyo Lane", phone_number: "123-456-7890", category: "japanese" },
  { name: "Pasta Palace", address: "456 Rome Street", phone_number: "987-654-3210", category: "italian" },
  { name: "Chez Pierre", address: "789 Paris Avenue", phone_number: "555-123-4567", category: "french" },
  { name: "Waffle House", address: "321 Brussels Blvd", phone_number: "222-333-4444", category: "belgian" },
  { name: "Golden Dragon", address: "101 Beijing Rd", phone_number: "333-222-1111", category: "chinese" }
]

# Seed the restaurants
puts "Seeding restaurants..."
restaurants.each do |restaurant_data|
  restaurant = Restaurant.create!(restaurant_data)
  puts "Created restaurant: #{restaurant.name}"

  # Add reviews for each restaurant
  3.times do |i|
    review = restaurant.reviews.create!(
      rating: rand(0..5),
      content: "Sample review #{i + 1} for #{restaurant.name}"
    )
    puts "  - Created review with rating #{review.rating}"
  end
end
