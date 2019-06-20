# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning the fridge.."
Measure.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

puts "Doing groceries.."
ingredients = %w{ almonds banana asparagus avocado cauliflower coconut nori spinach walnuts }

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

puts "Preping the veggies.."
Recipe.create!(
  name: "Vegane Poke Bowl",
  servings: 4,
  time: 30,
  category: "bowls",
  method: "Backofen auf 200 °C Ober-/Unterhitze vorheizen.
  Melone in 3 cm große Würfel schneiden. Mit Öl und Salz in einer feuerfesten Form vermischen und 30 Minuten im Ofen backen.
  Essig unterrühren, gut vermengen und weitere 30 Minuten im Ofen garen. Ab und zu umrühren.
  Melone aus dem Ofen nehmen, vollständig abkühlen lassen und fein geschnittenes Nori unterheben. Über Nacht im Kühlschrank ziehen lassen.
  Sushireis wie hier beschrieben zubereiten.
  Karotten mit dem Spiralschneider in Spiralen schneiden oder alternativ fein raspeln.
  Avocado in feine Scheiben schneiden. Erbsen 5 Minuten dämpfen, anschließend halbieren.
  Alles in einer Bowl anrichten und mit etwas Öl, Essig und Hawaiisalz abschmecken.",
  photo_url: "https://www.eat-this.org/wp-content/uploads/2017/08/Good-Life-Poke-Bowl-5-800x1200.jpg",
  link: "https://www.eat-this.org/vegane-poke-bowl/"
)
