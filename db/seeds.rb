puts "Cleaning the fridge.. 🧼"
User.destroy_all
Ingredient.destroy_all
Measure.destroy_all
Recipe.destroy_all
puts "All sparkly now.. ✨  "

puts "Sharpening the knives.. 🔪"
mirha = User.create!(email: "mirha@testing.com", password: "testing", admin: true)
puts "Chefs ready to get chopping.. 👩🏻‍🍳"

puts "Document the Avocado Smoothie.. 🥑"
avocado = Ingredient.create!(name: "avocado")
coconut_milk = Ingredient.create!(name: "coconut milk")
vanilla_essence = Ingredient.create!(name: "vanilla essence")

avocado_smoothie = Recipe.create!(name: "Avocado Smoothie",
                                  servings: 1,
                                  time: 5,
                                  category: "smoothie",
                                  method: "Place all the ingredients into a blender in the order listed and blend until smooth.",
                                  user: mirha)

avocado_smoothie_measures_attributes = [
  {
    amount: 240,
    unit: "ml",
    ingredient: coconut_milk,
    recipe: avocado_smoothie
  },
  {
    amount: 200,
    unit: "grams",
    ingredient: avocado,
    recipe: avocado_smoothie
  },
  {
    amount: 1,
    unit: "tsp",
    ingredient: vanilla_essence,
    recipe: avocado_smoothie
  }
]

avocado_smoothie_measures = Measure.create!(avocado_smoothie_measures_attributes)
puts "Let's blend.. 🥥"
