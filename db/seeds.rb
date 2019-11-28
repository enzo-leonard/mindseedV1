# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or saved alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.destroy_all
Deck.destroy_all
Theme.destroy_all
User.destroy_all

def addCard(parent,term, definition = nil)
  Card.create!(term: term, definition: definition, deck: parent)
end


enza = User.create!(username: "admin", password: "password", email: "admin@gmail.com", first_name: "Enza", avatar: "https://images.unsplash.com/photo-1546538994-4f15d0aa966f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")
user2 = User.create!(username: "toto", password: "password", email: "toto@gmail.com")
arnaud = User.create!(username: "arnaud", password: "password", email: "arnaud@gmail.com", first_name: "Arnaud", avatar: "https://avatars1.githubusercontent.com/u/55239555?v=4")
enzo = User.create!(username: "enzo", password: "password", email: "enzo@gmail.com", first_name: "Enzo", avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/zyh4tgnhlwhx5wrvtcfs.jpg")
melvin = User.create!(username: "melvin", password: "password", email: "melvin@gmail.com", first_name: "Melvin", avatar: "https://avatars1.githubusercontent.com/u/53007293?v=4")
simon = User.create!(username: "simon", password: "password", email: "simon@gmail.com", first_name: "Simon", avatar: "https://avatars1.githubusercontent.com/u/22522924?v=4")



puts "Creation du theme english"

user = User.first

english = Theme.new(name: "English")
english.user = user
english.save

verb = Deck.create!(
  name: "Verb",
  theme: english,
  rank: 1,
  parent: nil,
  original_owner: true)

name = Deck.create!(
  name: "Name",
  rank: 1,
  parent: nil,
  theme: english,
  original_owner: true)

expression = Deck.create!(
  name: "Expression",
  rank: 1,
  parent: nil,
  theme: english,
  original_owner: true)

first = Deck.create!(
  name: "First Group",
  rank: 2,
  parent: verb,
  theme: english,
  original_owner: true)

second = Deck.create!(
  name: "Second_group",
  rank: 2,
  parent: verb,
  theme: english,
  original_owner: true)

reg = Deck.create!(
  name: "Regular",
  rank: 3,
  parent: second,
  theme: english,
  original_owner: true)

irr = Deck.create!(
  name: "Irregular",
  rank: 3,
  parent:  second,
  theme:  english,
  original_owner: true)

Card.create!(
  term: "Abide",
  definition: "To suffer",
  deck: irr,
  context: "I said I would abide by their decision",
  memo: "avoir du bide ça fait souffire",
  photo: ""
)

Card.create!(
  term: "Beget",
  definition: "engendrer",
  deck: irr,
  context: "they hoped that the King might beget an heir by his new queen",
  memo: "",
  photo: ""
)


Card.create!(
  term: "Bereave",
  definition: "scold or criticize (someone) angrily.",
  deck: irr,
  context: "she berated herself for being fickle",
  memo: "",
  photo: ""
)


learn = Theme.create!(name: "How we learn", user: user)
brain = Deck.create!(name: "Neuroscience", rank: 1, parent: nil, theme: learn, original_owner: true)


full_stack = Theme.create!(name: "Full Stack", user: user)


ruby = Deck.create!(name: "Ruby", rank: 1, parent: nil, theme: full_stack, original_owner: true)
ruby_1 = Deck.create!(name: "Programming basics", rank: 2, parent: ruby, theme: full_stack, original_owner: true)
ruby_1_2 = Deck.create!(name: "Variable", rank: 3, parent: ruby_1, theme: full_stack, original_owner: true)
ruby_2 = Deck.create!(name: "Flow Conditionnal & Array", rank: 2, parent: ruby, theme: full_stack, original_owner: true)
ruby_3 = Deck.create!(name: "Iterator & Blocks", rank: 2, parent: ruby, theme: full_stack, original_owner: true)
ruby_4 = Deck.create!(name: "Hash & Symbols", rank: 2, parent: ruby, theme: full_stack, original_owner: true)
ruby_5 = Deck.create!(name: "Regular Expressions", rank: 2, parent: ruby, theme: full_stack, original_owner: true)
ruby_6 = Deck.create!(name: "Parsing", rank: 2, parent: ruby, theme: full_stack, original_owner: true)
oop = Deck.create!(name: "Oriented Object Programming", rank: 1, parent: nil, theme: full_stack, original_owner: true)
db = Deck.create!(name: "Database", rank: 1, parent: nil, theme: full_stack, original_owner: true)
front = Deck.create!(name: "Front", rank: 1, parent: nil, theme: full_stack, original_owner: true)
rails = Deck.create!(name: "Rails", rank: 1, parent: nil, theme: full_stack, original_owner: true)



history = Theme.create!(name: "History", user: user)
greek = Deck.create!(name: "Greek Mythology", rank: 1, parent: nil, theme: history, original_owner: true)
god = Deck.create!(name: "God", rank: 2, parent: greek, theme: history, original_owner: true)
demigod = Deck.create!(name: "SemiGod", rank: 2, parent: greek, theme: history, original_owner: true)
titan = Deck.create!(name: "Titant", rank: 2, parent: greek, theme: history, original_owner: true)
creature = Deck.create!(name: "Creature", rank: 2, parent: greek, theme: history, original_owner: true)

Card.create!(
  term: "Athena",
  definition: "goddess of wars",
  deck: god,
  context: "Athena !",
  memo: "Athena as the grece capital",
  photo: ""
)

Card.create!(
  term: "Apollo",
  definition: "",
  deck: god,
  context: "Athena !",
  memo: "Athena as the grece capital",
  photo: ""
)
Card.create!(term: "Poseidon", deck: god)
Card.create!(term: "Zeus", deck: god)
Card.create!(term: "Ares", deck: god)
Card.create!(term: "Artemis", deck: god)
Card.create!(term: "Aphrodite", deck: god)
Card.create!(term: "Hades", deck: god)
Card.create!(term: "Hephaestus", deck: god)
Card.create!(term: "Hera", deck: god)
Card.create!(term: "Hermes", deck: god)
Card.create!(term: "Hestia", deck: god)

Card.create!(term: "Cronus", deck: titan)

Card.create!(term: "Giant", deck: creature)
Card.create!(term: "Gorgons", deck: creature)
Card.create!(term: "Medusa", deck: creature)
Card.create!(term: "Pegasus", deck: creature)
Card.create!(term: "Talos", deck: creature)
Card.create!(term: "Cerberus", deck: creature)
Card.create!(term: "Cyclopes", deck: creature)

Card.create!(term: "Achilles", deck: demigod)
Card.create!(term: "Heracles", deck: demigod)
Card.create!(term: "Persueus", deck: demigod)
Card.create!(term: "Theseus", deck: demigod)

latin = Deck.create!(name: "Roman deities", rank: 1, parent: nil, theme: history)
romain_god = Deck.create!(name: "God ", rank: 2, parent: latin, theme: history)
addCard(romain_god, "Venus")
addCard(romain_god, "Phoebus")
addCard(romain_god, "Mars")
addCard(romain_god, "Saturn")
addCard(romain_god, "Ceres")
addCard(romain_god, "Bacchus")

geo = Theme.create!(name: "Geography", user: user)
capital = Deck.create!(name: "Capital", rank: 1, parent: nil, theme: geo, original_owner: true)
afrique = Deck.create!(name: "Africa", rank: 2, parent: capital, theme: geo, original_owner: true)
am_sud = Deck.create!(name: "South America", rank: 2, parent: capital, theme: geo, original_owner: true)
am_nord = Deck.create!(name: "North America", rank: 2, parent: capital, theme: geo, original_owner: true)
euro = Deck.create!(name: "Europe", rank: 2, parent: capital, theme: geo, original_owner: true)
asie = Deck.create!(name: "Asia", rank: 2, parent: capital, theme: geo, original_owner: true)

addCard(euro, "Paris", "France")
addCard(euro, "Madrid", "Spain")
addCard(euro, "Roma", "Italy")
addCard(euro, "London", "Great Britain")
addCard(euro, "Copenhagen", "Danemark")
addCard(euro, "Berlin", "Germany")

dietetic = Theme.create!(name: "Dietetic", user: melvin)
general = Deck.create!(name: "General", rank: 1, parent: nil, theme: dietetic, original_owner: true)
glucose = Deck.create!(name: "Glucose", rank: 2, parent: general, theme: dietetic, original_owner: true)
lipid = Deck.create!(name: "Lipid", rank: 2, parent: general, theme: dietetic, original_owner: true)
protein = Deck.create!(name: "Protein", rank: 2, parent: general, theme: dietetic, original_owner: true)
vitamins = Deck.create!(name: "Vitamins", rank: 2, parent: general, theme: dietetic, original_owner: true)
minerals = Deck.create!(name: "Minerals", rank: 2, parent: general, theme: dietetic, original_owner: true)

# cards glucose
Card.create!(
  term: "Glucose",
  definition: "a simple sugar which is an important energy source in living organisms and is a component of many carbohydrates.",
  deck: glucose,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "Where glucose is found?",
  definition: "It is found in the sap of plants, and is found in the human bloodstream where it is referred to as blood sugar.",
  deck: glucose,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "What should my glucose level be?",
  definition: "Normal blood sugar levels are less than 100 mg/dL after not eating (fasting) for at least eight hours. And they're less than 140 mg/dL two hours after eating. ",
  deck: glucose,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "What is glucose simple?",
  definition: "Glucose is the main type of sugar in the blood and is the major source of energy for the body's cells.",
  deck: glucose,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "What food is glucose found in?",
  definition: "The body's main source of energy and is found in fruit such as pasta, whole grain bread, legumes and a range of vegetables.",
  deck: glucose,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "Types of glucose?",
  definition: "Simple carbohydrates are either monosaccharides (one sugar molecule) or disaccharides (two sugar molecules)",
  deck: glucose,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "Monosaccharides",
  definition: "The two main monosaccharides are glucose and fructose.",
  deck: glucose,
  context: "",
  memo: "",
  photo: ""
)

# cards lipid
Card.create!(
  term: "Lipid",
  definition: "Any of a class of organic compounds that are fatty acids or their derivatives.",
  deck: lipid,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "What is the function for lipids?",
  definition: "The functions of lipids include storing energy, signaling, and acting as structural components of cell membranes.",
  deck: lipid,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "What is a lipid in food?",
  definition: "The three main types of lipids are triacylglycerols, phospholipids, and sterols.",
  deck: lipid,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "What foods are high in lipids?",
  definition: "    Avocados, Cheese, Dark Chocolate, Whole Eggs, Fatty Fish, Nuts, Chia Seeds, Extra Virgin Olive Oil.",
  deck: lipid,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "How lipids are formed?",
  definition: "When one reacts with a fatty acid a monoglyceride forms. When two react with two fatty acid molecules a digylceride forms.",
  deck: lipid,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "What are high lipids?",
  definition: "that means you have high blood levels of low-density lipoprotein (LDL) cholesterol, and fats called triglycerides, or both.",
  deck: lipid,
  context: "",
  memo: "",
  photo: ""
)

Card.create!(
  term: "Are steroids lipids?",
  definition: "Steroids are lipids because they are hydrophobic and insoluble in water, but they do not resemble lipids since they have a structure composed of four fused rings. ",
  deck: lipid,
  context: "",
  memo: "",
  photo: ""
)

def printChild(parent)
  parent.childs.each do |child|
    puts " #{"-"*child.rank} (#{child.cards.count})"                                                                                                                                                                                                                                                                          +child.name
    printChild(child) if child.childs
  end
end


puts "liste des thèmes : \n\n"

themes = Theme.all
themes.each do |t|
  puts "\n\n--------------\nTheme : #{t.name}\n-------------\n\n"
  t.decks.each do |x|
    puts "- "+x.name  if x.rank == 1
    printChild(x) if x.rank == 1
  end
end


