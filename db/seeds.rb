# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning the fridge.."
Ingredient.destroy_all

puts "Doing groceries.."
ingredients = %w{ almonds banana asparagus avocado cauliflower coconut nori spinach walnuts }

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

puts "Preping the veggies.."
Recipe.create!(
  name: "Banana Cauliflower Smoothie",
  servings: 1,
  time: 5,
  category: "breakfast",
  method: "Blend it",
  photo_url: "https://images.unsplash.com/photo-1494315153767-9c231f2dfe79",
  link: "https://www.eat-this.org/"
)
