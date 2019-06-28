require 'open-uri'

# Ingredient.destroy_all if Rails.env.development?
puts "Cleaning the fridge.."
Measure.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

puts "Doing groceries.."
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
sorted_ingredients = ingredients["drinks"].sort_by { |element| element["strIngredient1"].capitalize }
sorted_ingredients.each { |ingredient| Ingredient.create!(name: ingredient["strIngredient1"]) }

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
puts "Let's cook!"
