require 'open-uri'

# Ingredient.destroy_all if Rails.env.development?
puts "Cleaning the fridge, burning the books.."
Measure.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
puts "The coast is clear.."

# Adding users
puts "Kidnapping chefs.."
user_attributes = [
  {
    email: "mirha@testing.com",
    password: "testing",
    admin: true
  },
  {
    email: "g@testing.com",
    password: "testing"
  },
]
User.create!(user_attributes)
puts "Chefs ready to get chopping.."

# puts "Doing groceries.."
# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# ingredients = JSON.parse(open(url).read)
# sorted_ingredients = ingredients["drinks"].sort_by { |element| element["strIngredient1"].capitalize }
# sorted_ingredients.each { |ingredient| Ingredient.create!(name: ingredient["strIngredient1"]) }

# Creating ingredients
puts "Doing groceries.."
eat_this_ingredients = %w(
  Wassermelone
  Erdnussöl
  Salz
  Apfelessig
  Nori
  Sushireis
  Karotten
  Avocado
  Erbsen
  Chinakohl
  grüner\ Salat
  Minigurken
  Gurkenscheiben
  Sesam
  Traubenkernöl
  Hawaii-Salz
  Karotte
  Frühlingszwiebel
  Knoblauchzehen
  koreanische\ Chiliflocken
  Sojasauce
  brauner\ Zucker
  Kurkumawurzel
  Ingwer
  Kardamomkapseln
  Muskat
  Zimt
  schwarzer\ Pfeffer
  Pflanzenmilch
  Kurkuma-Paste
  Ahornsirup
  Leinsamen
  schwarze\ Bohnen
  Haferflocken
  Misopaste
  Thymian
  Kreuzkümmel
  Champignons
  Olivenöl
  rote\ Zwiebel
  Walnüsse
  vegane\ Mayonnaise
  mittelscharfer\ Senf
  Cashewkerne
  rote\ Chili
  Sojamilch
  Burgerbrötchen
  Tomaten
  Salzgurken
  Salatblätter
  veganer\ Bacon
  Aubergine
  Olivenöl
  Zwiebel
  Gurke
  Kichererbsen
  Kala\ Namak
  Petersilie
  Koriander
  grüne\ Chili
  Kreuzkümmel
  Koriandersamen
  Zitrone
  Pita-Brote
  Tahin
  Sojajoghurt
)

eat_this_ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end
puts "Groceries are bagged up.."

# Creating recipes
puts "Prepping the veggies.."
recipe_attributes = [
  {
    name: "Vegane Poke Bowl",
    servings: "4 Bowls",
    time: 30,
    category: "Bowls",
    method:"
    1. Backofen auf 200 °C Ober-/Unterhitze vorheizen.

    2. Melone in 3 cm große Würfel schneiden. Mit Öl und Salz in einer feuerfesten Form vermischen und 30 Minuten im Ofen backen.

    3. Essig unterrühren, gut vermengen und weitere 30 Minuten im Ofen garen. Ab und zu umrühren.

    4. Melone aus dem Ofen nehmen, vollständig abkühlen lassen und fein geschnittenes Nori unterheben. Über Nacht im Kühlschrank ziehen lassen.

    5. Sushireis wie hier beschrieben zubereiten.

    6. Karotten mit dem Spiralschneider in Spiralen schneiden oder alternativ fein raspeln.

    7. Avocado in feine Scheiben schneiden. Erbsen 5 Minuten dämpfen, anschließend halbieren.

    8. Alles in einer Bowl anrichten und mit etwas Öl, Essig und Hawaiisalz abschmecken.",
    link_to_photo: "https://www.eat-this.org/wp-content/uploads/2017/08/Good-Life-Poke-Bowl-5-800x1200.jpg",
    link: "https://www.eat-this.org/vegane-poke-bowl/",
    photo: "https://res.cloudinary.com/mirhamasala/image/upload/v1519107793/rhlgu1twsxe3jpo5srgt.jpg",
    user_id: 1
  },
  {
    name: "Schnelles Kimchi",
    servings: "500ml Weck Jar",
    time: 60,
    category: "Preservatives",
    method: "Chinakohl in Spalten, anschließend in etwa 3 x 3 cm große Stücke schneiden. Karotte in feine Stifte, Frühlingszwiebel in Stücke schneiden. Mit dem Salz vermengen und 30 Minuten ziehen lassen, anschließend gut abspülen und abtropfen lassen.

    Knoblauch pressen und mit den Chiliflocken, der Sojasauce und dem Zucker glatt rühren.

    Alles miteinander verrühren, mit den Händen 2 Minuten gut durchmassieren, in ein sauberes, trockenes Einmachglas füllen und im Kühlschrank lagern.

    **Tipp:** Direkt vor dem Essen mit ein paar gerösteten Sesamsamen toppen. Lecker!

    Unser schneller Notfall-Kimchi kann frisch gegessen werden (Logo, sonst wäre es ja kein Notfall-Kimchi), schmeckt aber noch besser, wenn du ihn einige Tage im Kühlschrank ziehen lässt.",
    link_to_photo: "https://www.eat-this.org/wp-content/uploads/2016/07/kimchi-feature_-960x651@2x.jpg",
    link: "https://www.eat-this.org/schnelles-kimchi/",
    user_id: 1
  },
  {
    name: "Goldene Milch",
    servings: "15 Cups",
    time: 40,
    category: "Drinks",
    method: "**FÜR DIE KURKUMA-PASTE**

    1. Kurkuma und Ingwer schälen und fein reiben, Kardamomkapseln leicht andrücken. Anschließend zusammen mit den restlichen Gewürzen in einen Topf geben, mit 250 ml Wasser aufgießen und aufkochen und  bei niedriger Hitze etwa 25-30 Minuten einreduzieren lassen.

    2. Kardamomkapseln entfernen und mit einem Pürierstab zu einer feinen Paste pürieren.

    **FÜR DIE GOLDENE MILCH**

    1. Pflanzenmilch in einen Topf geben und erhitzen. Kurkuma-Paste mit einem Schneebesen einrühren und unter Rühren aufkochen. Bei niedriger bis mittlerer Hitze noch 2-3 Minuten köcheln lassen und mit Ahornsirup gesüßt heiß servieren.

    **TIPPS**

    Achtung: Verwende zur Zubereitung der Paste unbedingt Einmalhandschuhe – die Kurkumawurzeln färben wirklich extrem und lassen sich nicht so einfach mit Wasser und Seife entfernen. Auch Kunstoffbehälter, die damit in Berührung gekommen sind, behalten einen gelblichen Ton.

    Die Paste hält sich in einem sauberen Schraubglas im Kühlschrank etwa 5 Tage, am besten lässt sie sich aber portionsweise in einer Eiswürfelform im Eisfach aufbewahren.
    ",
    link_to_photo: "https://www.eat-this.org/wp-content/uploads/2019/01/goldene-milch-3-1280x854@2x.jpg",
    link: "https://www.eat-this.org/goldene-milch/",
    user_id: 1
  },
  {
    name: "Black Bean Burger",
    servings: "4 Burgers",
    time: 50,
    category: "Dinner",
    method: "**FÜR DIE PATTIES**

    1. Leinsamen mit 3 EL Wasser 10 Minuten quellen lassen.

    2. 2/3 der Bohnen zusammen mit Haferflocken, Misopaste und den Gewürzen im Food Processor fein pürieren.

    3. Champignons fein hacken. 1 EL Öl in eine heiße Pfanne geben, Champignons bei mittlerer bis hoher Hitze 6 Minuten braten. Mit 1/2 TL Salz würzen.

    4. Zwiebel reiben und gut ausdrücken.

    5. Gebratene Champignons, geriebene Zwiebel, die restlichen Bohnen, Leinsamen und Walnüsse zur Pattymasse geben und mit der 'Pulse'-Funktion des Food Processors kurz hacken und unterheben.

    6. Vier Patties formen und bis zum Braten auf einem Stück Backpapier beiseite stellen.

    7. Öl in eine heiße Pfanne geben, Patties bei mittlerer bis hoher Hitze 5 Minuten pro Seite braten.

    **FÜR DIE BURGERSAUCE**

    1. Cashews mindestens 4 Stunden in reichlich Wasser einweichen. Alle Zutaten in einem High-Speed-Blender fein pürieren.

    **BURGER ZUSAMMENBAUEN**

    1. Tomaten, Gurken und die restliche Zwiebel in dünne Scheiben schneiden. Veganen Bacon halbieren.

    2. Burger Buns aufschneiden, mit der Schnittseite nach unten in einer heißen Pfanne ohne Öl oder auf dem Grill 1 Minute aufwärmen. Jeweils mit Burgersauce, einem Salatblatt, einem Black-Bean-Walnuss-Patty, Salzgurken, veganem Bacon, Tomaten und Zwiebelscheiben belegen.

    **TIPPS**

    Die Patties sind auch grillbar! Also Kohlen anfeuern und ab auf den heißen Rost damit.",
    link_to_photo: "https://www.eat-this.org/wp-content/uploads/2017/07/Weltbester-Black-Bean-Burger-3-960x640@2x.jpg",
    link: "https://www.eat-this.org/weltbester-black-bean-burger/",
    user_id: 1
  },
  {
    name: "Sabich",
    servings: "4 Sandwiches",
    time: 35,
    category: "Breakfast",
    method: "**FÜR DIE FÜLLUNG**

      1. Aubergine in 1 cm dicke Scheiben schneiden. Mit 1 TL Salz würzen und beiseitestellen. So kann überschüssiges Wasser austreten und die Auberginen werden beim Braten auch mit weniger Öl schneller gar.

      2. Zwiebel in dünne Ringe schneiden, mit Apfelessig vermischen und ebenfalls beiseitestellen.

      3. Tomaten und Gurken vom Kerngehäuse befreien und jeweils in 1 1/2 cm große Würfel, Frühlingszwiebel in dünne Ringe schneiden. Vermengen und mit einer Prise Salz würzen. Ebenfalls beiseitestellen.

      4. 1 EL Olivenöl in eine heiße Pfanne geben, Kichererbsen bei mittlerer bis hoher Hitze 5 Minuten rösten. Ab und zu umrühren. Anschließend aus der Pfanne nehmen und mit Kala Namak würzen.

      5. Auberginen abwaschen, trockentupfen, das restliche Olivenöl in die Pfanne geben und die Scheiben 10 Minuten goldbraun braten. Dabei mit dem Pfannenwender flach drücken, sodass das überschüssige Wasser austritt. Nach der Hälfte der Zeit wenden. Mit 1/2 TL Salz würzen.

      **FÜR DIE ZHOUG-SAUCE**

      1. Alle Zutaten grob pürieren.

      **ZUM ANRICHTEN**

      1. Pita-Brote kurz toasten, jeweils mit 1 EL Tahin bestreichen, mit Tomaten-Gurken-Salat, Auberginenscheiben und Kichererbsen füllen und mit Zhoug, Sojajoghurt und den eingelegten Zwiebeln toppen.",
    link_to_photo: "https://www.eat-this.org/wp-content/uploads/2019/04/sabich-israelisches-fruehstuecks-sandwich-12-800x1200@2x.jpg",
    link: "https://www.eat-this.org/sabich-israelisches-fruehstuecks-sandwich/",
    user_id: 1
  }
]

Recipe.create!(recipe_attributes)

# Adding measures and ingredients to recipes
# RECIPE 1
puts "Measuring the goods for Vegane Poke Bowl.."
measures_vegane_poke_bowl = [
  {
    amount: 500,
    unit: "g",
    ingredient: Ingredient.find_by_name("wassermelone"),
    recipe: Recipe.find(1)
  },
  {
    amount: 4,
    unit: "el",
    ingredient: Ingredient.find_by_name("erdnussöl"),
    recipe: Recipe.find(1)
  },
  {
    amount: 1.5,
    unit: "tl",
    ingredient: Ingredient.find_by_name("salz"),
    recipe: Recipe.find(1)
  },
  {
    amount: 0.5,
    unit: "blatt",
    ingredient: Ingredient.find_by_name("nori"),
    recipe: Recipe.find(1)
  },
  {
    amount: 150,
    unit: "g",
    ingredient: Ingredient.find_by_name("sushireis"),
    recipe: Recipe.find(1)
  },
  {
    amount: 2,
    ingredient: Ingredient.find_by_name("karotten"),
    recipe: Recipe.find(1)
  },
  {
    amount: 2,
    ingredient: Ingredient.find_by_name("avocado"),
    recipe: Recipe.find(1)
  },
  {
    amount: 1,
    unit: "handvoll",
    ingredient: Ingredient.find_by_name("erbsen"),
    recipe: Recipe.find(1)
  },
  {
    amount: 8,
    unit: "blätter",
    ingredient: Ingredient.find_by_name("chinakohl"),
    recipe: Recipe.find(1)
  },
  {
    amount: 8,
    unit: "blätter",
    ingredient: Ingredient.find_by_name("grüner salat"),
    recipe: Recipe.find(1)
  },
  {
    amount: 1,
    unit: "handvoll",
    ingredient: Ingredient.find_by_name("minigurken"),
    recipe: Recipe.find(1)
  },
  {
    amount: 4,
    unit: "tl",
    ingredient: Ingredient.find_by_name("sesam"),
    recipe: Recipe.find(1)
  },
  {
    amount: 4,
    unit: "el",
    ingredient: Ingredient.find_by_name("traubenkernöl"),
    recipe: Recipe.find(1)
  },
  {
    amount: 4,
    unit: "el",
    ingredient: Ingredient.find_by_name("apfelessig"),
    recipe: Recipe.find(1)
  },
  {
    amount: 0.25,
    unit: "tl",
    ingredient: Ingredient.find_by_name("hawaii-salz"),
    recipe: Recipe.find(1)
  }
]

Measure.create!(measures_vegane_poke_bowl)
puts "Vegane Poke Bowl is served.."

# RECIPE 2
puts "Measuring the goods for Schnelles Kimchi.."
measures_schnelles_kimchi = [
  {
    amount: 300,
    unit: "g",
    ingredient: Ingredient.find_by_name("chinakohl"),
    recipe: Recipe.find(2)
  },
  {
    amount: 2,
    unit: "el",
    ingredient: Ingredient.find_by_name("salz"),
    recipe: Recipe.find(2)
  },
  {
    amount: 0.5,
    ingredient: Ingredient.find_by_name("karotte"),
    recipe: Recipe.find(2)
  },
  {
    amount: 0.5,
    ingredient: Ingredient.find_by_name("frühlingszwiebel"),
    recipe: Recipe.find(2)
  },
  {
    amount: 2,
    unit: "",
    ingredient: Ingredient.find_by_name("knoblauchzehen"),
    recipe: Recipe.find(2)
  },
  {
    amount: 3,
    unit: "el",
    ingredient: Ingredient.find_by_name("koreanische chiliflocken"),
    recipe: Recipe.find(2)
  },
  {
    amount: 2,
    unit: "el",
    ingredient: Ingredient.find_by_name("sojasauce"),
    recipe: Recipe.find(2)
  },
  {
    amount: 1,
    unit: "tl",
    ingredient: Ingredient.find_by_name("brauner zucker"),
    recipe: Recipe.find(2)
  }
]

Measure.create!(measures_schnelles_kimchi)
puts "Schnelles Kimchi is served.."

# RECIPE 3
puts "Measuring the goods for Goldene Milch.."
measures_goldene_milch = [
  {
    amount: 90,
    unit: "g",
    ingredient: Ingredient.find_by_name("kurkumawurzel"),
    recipe: Recipe.find(3)
  },
  {
    amount: 60,
    unit: "g",
    ingredient: Ingredient.find_by_name("ingwer"),
    recipe: Recipe.find(3)
  },
  {
    amount: 5,
    ingredient: Ingredient.find_by_name("kardamomkapseln"),
    recipe: Recipe.find(3)
  },
  {
    amount: 1,
    unit: "prise",
    ingredient: Ingredient.find_by_name("muskat"),
    recipe: Recipe.find(3)
  },
  {
    amount: 3,
    unit: "tl",
    ingredient: Ingredient.find_by_name("zimt"),
    recipe: Recipe.find(3)
  },
  {
    amount: 0.75,
    unit: "tl",
    ingredient: Ingredient.find_by_name("schwarzer pfeffer"),
    recipe: Recipe.find(3)
  },
  {
    amount: 500,
    unit: "ml",
    ingredient: Ingredient.find_by_name("pflanzenmilch"),
    recipe: Recipe.find(3)
  },
  {
    amount: 2,
    unit: "tl",
    ingredient: Ingredient.find_by_name("kurkuma-paste"),
    recipe: Recipe.find(3)
  },
  {
    amount: 2,
    unit: "tl",
    ingredient: Ingredient.find_by_name("ahornsirup"),
    recipe: Recipe.find(3)
  }
]

Measure.create!(measures_goldene_milch)
puts "Goldene Milch is served.."

# RECIPE 4
puts "Measuring the goods for Black Bean Burger.."
measures_black_bean_burger = [
  {
    amount: 3,
    unit: "el",
    ingredient: Ingredient.find_by_name("leinsamen"),
    recipe: Recipe.find(4)
  },
  {
    amount: 250,
    unit: "g",
    ingredient: Ingredient.find_by_name("schwarze bohnen"),
    recipe: Recipe.find(4)
  },
  {
    amount: 70,
    unit: "g",
    ingredient: Ingredient.find_by_name("haferflocken"),
    recipe: Recipe.find(4)
  },
  {
    amount: 1,
    unit: "tl",
    ingredient: Ingredient.find_by_name("misopaste"),
    recipe: Recipe.find(4)
  },
  {
    amount: 1,
    unit: "tl",
    ingredient: Ingredient.find_by_name("thymian"),
    recipe: Recipe.find(4)
  },
  {
    amount: 1,
    unit: "tl",
    ingredient: Ingredient.find_by_name("kreuzkümmel"),
    recipe: Recipe.find(4)
  },
  {
    amount: 150,
    unit: "g",
    ingredient: Ingredient.find_by_name("champignons"),
    recipe: Recipe.find(4)
  },
  # {
  #   amount: 1,
  #   unit: "el",
  #   ingredient: Ingredient.find_by_name("olivenöl"),
  #   recipe: Recipe.find(4)
  # },
  {
    amount: 0.5,
    unit: "tl",
    ingredient: Ingredient.find_by_name("salz"),
    recipe: Recipe.find(4)
  },
  {
    amount: 1,
    ingredient: Ingredient.find_by_name("rote zwiebel"),
    recipe: Recipe.find(4)
  },
  {
    amount: 40,
    unit: "g",
    ingredient: Ingredient.find_by_name("walnüsse"),
    recipe: Recipe.find(4)
  },
  {
    amount: 5,
    unit: "el",
    ingredient: Ingredient.find_by_name("olivenöl"),
    recipe: Recipe.find(4)
  },
  {
    amount: 2,
    unit: "tl",
    ingredient: Ingredient.find_by_name("vegane mayonnaise"),
    recipe: Recipe.find(4)
  },
  {
    amount: 1,
    unit: "tl",
    ingredient: Ingredient.find_by_name("mittelscharfer senf"),
    recipe: Recipe.find(4)
  },
  {
    amount: 15,
    unit: "g",
    ingredient: Ingredient.find_by_name("cashewkerne"),
    recipe: Recipe.find(4)
  },
  {
    amount: 0.5,
    ingredient: Ingredient.find_by_name("rote chili"),
    recipe: Recipe.find(4)
  },
  {
    amount: 5,
    unit: "el",
    ingredient: Ingredient.find_by_name("sojamilch"),
    recipe: Recipe.find(4)
  },
  {
    amount: 4,
    ingredient: Ingredient.find_by_name("burgerbrötchen"),
    recipe: Recipe.find(4)
  },
  {
    amount: 2,
    ingredient: Ingredient.find_by_name("tomaten"),
    recipe: Recipe.find(4)
  },
  {
    amount: 2,
    ingredient: Ingredient.find_by_name("salzgurken"),
    recipe: Recipe.find(4)
  },
  # {
  #   amount: 0.5,
  #   ingredient: Ingredient.find_by_name("rote zwiebel"),
  #   recipe: Recipe.find(4)
  # },
  {
    amount: 4,
    ingredient: Ingredient.find_by_name("salatblätter"),
    recipe: Recipe.find(4)
  },
  {
    amount: 6,
    unit: "streifen",
    ingredient: Ingredient.find_by_name("veganer bacon"),
    recipe: Recipe.find(4)
  }
]

Measure.create!(measures_black_bean_burger)
# puts "Black Bean Burger is served.."

# RECIPE 5
puts "Measuring the goods for Sabich.."
measures_sabich = [
  {
    amount: 300,
    unit: "g",
    ingredient: Ingredient.find_by_name("aubergine"),
    recipe: Recipe.find(5)
  },
  {
    amount: 2.75,
    unit: "tl",
    ingredient: Ingredient.find_by_name("salz"),
    recipe: Recipe.find(5)
  },
  {
    amount: 5,
    unit: "el",
    ingredient: Ingredient.find_by_name("olivenöl"),
    recipe: Recipe.find(5)
  },
  {
    amount: 1,
    ingredient: Ingredient.find_by_name("rote zwiebel"),
    recipe: Recipe.find(5)
  },
  {
    amount: 3,
    unit: "el",
    ingredient: Ingredient.find_by_name("apfelessig"),
    recipe: Recipe.find(5)
  },
  {
    amount: 2,
    ingredient: Ingredient.find_by_name("tomaten"),
    recipe: Recipe.find(5)
  },
  {
    amount: 0.5,
    ingredient: Ingredient.find_by_name("gurke"),
    recipe: Recipe.find(5)
  },
  {
    amount: 1,
    ingredient: Ingredient.find_by_name("frühlingszwiebel"),
    recipe: Recipe.find(5)
  },
  # {
  #   amount: 0.25,
  #   unit: "tl",
  #   ingredient: Ingredient.find_by_name("salz"),
  #   recipe: Recipe.find(5)
  # },
  {
    amount: 125,
    unit: "g",
    ingredient: Ingredient.find_by_name("kichererbsen"),
    recipe: Recipe.find(5)
  },
  {
    amount: 0.5,
    unit: "tl",
    ingredient: Ingredient.find_by_name("kala namak"),
    recipe: Recipe.find(5)
  },
  {
    amount: 0.5,
    unit: "bund",
    ingredient: Ingredient.find_by_name("petersilie"),
    recipe: Recipe.find(5)
  },
  {
    amount: 0.5,
    unit: "bund",
    ingredient: Ingredient.find_by_name("koriander"),
    recipe: Recipe.find(5)
  },
  {
    amount: 1,
    ingredient: Ingredient.find_by_name("grüne chili"),
    recipe: Recipe.find(5)
  },
  {
    amount: 0.25,
    unit: "tl",
    ingredient: Ingredient.find_by_name("kreuzkümmel"),
    recipe: Recipe.find(5)
  },
  {
    amount: 0.5,
    unit: "tl",
    ingredient: Ingredient.find_by_name("koriandersamen"),
    recipe: Recipe.find(5)
  },
  {
    amount: 1,
    unit: "tl",
    ingredient: Ingredient.find_by_name("ahornsirup"),
    recipe: Recipe.find(5)
  },
  # {
  #   amount: 1,
  #   unit: "tl",
  #   ingredient: Ingredient.find_by_name("salz"),
  #   recipe: Recipe.find(5)
  # },
  {
    amount: 1,
    ingredient: Ingredient.find_by_name("zitrone"),
    recipe: Recipe.find(5)
  },
  # {
  #   amount: 1,
  #   unit: "el",
  #   ingredient: Ingredient.find_by_name("olivenöl"),
  #   recipe: Recipe.find(5)
  # },
  {
    amount: 4,
    ingredient: Ingredient.find_by_name("pita-brote"),
    recipe: Recipe.find(5)
  },
  {
    amount: 4,
    unit: "el",
    ingredient: Ingredient.find_by_name("tahin"),
    recipe: Recipe.find(5)
  },
  {
    amount: 4,
    unit: "el",
    ingredient: Ingredient.find_by_name("sojajoghurt"),
    recipe: Recipe.find(5)
  }
]

Measure.create!(measures_sabich)
puts "Sabich is served.."

puts "Let's cook!"
