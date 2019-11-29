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
  Card.create!(term: term, definition: definition, deck: parent, vitality: 100)
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
english.user = enzo
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
  term: "Abide", vitality: 100,
  definition: "To suffer",
  deck: irr,
  context: "I said I would abide by their decision",
  memo: "avoir du bide ça fait souffire",
  photo: ""
)

Card.create!(
  term: "Beget", vitality: 100,
  definition: "engendrer",
  deck: irr,
  context: "they hoped that the King might beget an heir by his new queen",
  memo: "",
  photo: ""
)


Card.create!(
  term: "Bereave", vitality: 100,
  definition: "scold or criticize (someone) angrily.",
  deck: irr,
  context: "she berated herself for being fickle",
  memo: "",
  photo: ""
)


learn = Theme.create!(name: "How we learn", user: user)
brain = Deck.create!(name: "Neuroscience", rank: 1, parent: nil, theme: learn, original_owner: true)


full_stack = Theme.create!(name: "Informatic", user: enzo)


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



history = Theme.create!(name: "History", user: enzo)
joke = Theme.create!(name: "Jokes", user: enzo)
chuck = Deck.create!(name: "Chuck noris", rank: 1, parent: nil, theme: joke, original_owner: true)
20.times do
  addCard(chuck, "toto", "titi")
  addCard(verb, "toto", "titi")
end

50.times do
  addCard(ruby, "toto", "titi")
end

greek = Deck.create!(name: "Greek Mythology", rank: 1, parent: nil, theme: history, original_owner: true)
  god = Deck.create!(name: "God", rank: 2, parent: greek, theme: history, original_owner: true)
  demigod = Deck.create!(name: "SemiGod", rank: 2, parent: greek, theme: history, original_owner: true)
  # titan = Deck.create!(name: "Titant", rank: 2, parent: greek, theme: history, original_owner: true)
  creature = Deck.create!(name: "Creature", rank: 2, parent: greek, theme: history, original_owner: true)

french = Deck.create!(name: "French", rank: 1, parent: nil, theme: history, original_owner: true)

Card.create!(
  term: "Athena", vitality: 100,
  definition: " Artemis in the ancient Greek religion, is the goddess of the hunt, the wilderness.",
  deck: god,
  context: "Athena !",
  memo: "Athena as the grece capital",
  photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Mattei_Athena_Louvre_Ma530_n2.jpg/220px-Mattei_Athena_Louvre_Ma530_n2.jpg"
)

Card.create!(
  term: "Apollo", vitality: 100,
  definition: "Apollo is one of the most important and complex of the Olympian deities in classical Greek.",
  deck: god,
  context: "Athena !",
  memo: "Athena as the grece capital",
  photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Apollo_of_the_Belvedere.jpg/220px-Apollo_of_the_Belvedere.jpg"
)
Card.create!(term: "Poseidon", definition: "Poseidon was one of the Twelve Olympians in ancient Greek religion and myth, god of the sea.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/0036MAN_Poseidon.jpg/220px-0036MAN_Poseidon.jpg", vitality: 50, deck: god)
Card.create!(term: "Zeus", definition: "Zeús is the thunder god in ancient Greek religion, who rules as king of the gods of Mount Olympus.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Jupiter_Smyrna_Louvre_Ma13.jpg/220px-Jupiter_Smyrna_Louvre_Ma13.jpg", vitality: 50, deck: god)
Card.create!(term: "Ares", definition: "Ares is the Greek god of war. He is one of the Twelve Olympians, the son of Zeus and Hera.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Ares_Canope_Villa_Adriana_b.jpg/220px-Ares_Canope_Villa_Adriana_b.jpg", vitality: 50, deck: god)
Card.create!(term: "Artemis", definition: "Artemis, in the ancient Greek religion and myth, is the goddess of the hunt, the wilderness.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Diane_de_Versailles_Leochares.jpg/220px-Diane_de_Versailles_Leochares.jpg",vitality: 50, deck: god)
Card.create!(term: "Aphrodite", definition: "Aphrodite is an ancient Greek goddess associated with love, beauty, pleasure, passion and procreation.", photo: "https://upload.wikimedia.org/wikipedia/commons/0/02/NAMA_Aphrodite_Syracuse.jpg" ,vitality: 50, deck: god)
Card.create!(term: "Hades", definition: "Hades, in the ancient Greek religion and myth, is the god of the dead and the king of the underworld.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Hades-et-Cerberus-III.jpg/220px-Hades-et-Cerberus-III.jpg" ,vitality: 50, deck: god)
Card.create!(term: "Hephaestus", definition: "Hephaestus is the Greek god of blacksmiths, metalworking, carpenters, craftsmen, artisans...", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Vulcan_Coustou_Louvre_MR1814.jpg/220px-Vulcan_Coustou_Louvre_MR1814.jpg" ,vitality: 50, deck: god)
Card.create!(term: "Hera", definition: "Hera is the goddess of women, marriage, family, and childbirth in ancient Greek religion and myth.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Hera_Campana_Louvre_Ma2283.jpg/220px-Hera_Campana_Louvre_Ma2283.jpg" ,vitality: 50, deck: god)
Card.create!(term: "Hermes", definition: "Hermes is the god of trade, heralds, commerce, thieves, sports, travelers, and athletes.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Hermes_Ingenui_Pio-Clementino_Inv544.jpg/220px-Hermes_Ingenui_Pio-Clementino_Inv544.jpg" ,vitality: 50, deck: god)

# Card.create!(term: "Cronus", vitality: 100, deck: titan)

Card.create!(term: "Giant", definition: "In Greek Mythology, the Giants, also called Gigantes, were a race of great strength.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Poseidon_Polybotes_Cdm_Paris_573.jpg/220px-Poseidon_Polybotes_Cdm_Paris_573.jpg", vitality: 100, deck: creature)
Card.create!(term: "Gorgons", definition: "In Greek mythology, a Gorgon turn people to horrifying visage that turned those who beheld her to stone.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Crat%C3%A8re_de_Vix_0007.jpg/180px-Crat%C3%A8re_de_Vix_0007.jpg", vitality: 100, deck: creature)
Card.create!(term: "Medusa", definition: "In Greek mythology, Medusa was a a Gorgon, generally described as a winged human female.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Gorgoneion.JPG/280px-Gorgoneion.JPG", vitality: 100, deck: creature)
# Card.create!(term: "Pegasus", vitality: 100, deck: creature)
# Card.create!(term: "Talos", vitality: 100, deck: creature)
# Card.create!(term: "Cerberus", vitality: 100, deck: creature)
# Card.create!(term: "Cyclopes", vitality: 100, deck: creature)

# Card.create!(term: "Achilles", vitality: 100, deck: demigod)
# Card.create!(term: "Heracles", vitality: 100, deck: demigod)
# Card.create!(term: "Persueus", vitality: 100, deck: demigod)
# Card.create!(term: "Theseus", vitality: 100, deck: demigod)

# latin = Deck.create!(name: "Roman deities", rank: 1, parent: nil, theme: history)
# romain_god = Deck.create!(name: "God ", rank: 2, parent: latin, theme: history)
# addCard(romain_god, "Venus")
# addCard(romain_god, "Phoebus")
# addCard(romain_god, "Mars")
# addCard(romain_god, "Saturn")
# addCard(romain_god, "Ceres")
# addCard(romain_god, "Bacchus")

geo = Theme.create!(name: "Geography", user: enzo)
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
  term: "Glucose", vitality: 100,
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























































general_knowledge = Theme.create!(name: "General Knowledge", user: arnaud)
general_knowledge = Theme.create!(name: "Culture G", user: enzo)
french_history = Deck.create!(name: "French History", rank: 1, parent: nil, theme: general_knowledge, original_owner: true)
french_kings = Deck.create!(name: "French Kings", rank: 2, parent: french_history, theme: general_knowledge, original_owner: true)
Card.create!(term: "Louis XIV", definition: "Known as Louis the Great or the Sun King, was King of France from May 1643 until his death in 1715.", photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Louis_XIV_of_France.jpg/1024px-Louis_XIV_of_France.jpg", vitality: 0, deck: french_kings)
Card.create!(term: "Charles X", definition: "King of France from September 1824 until August 1830. He was known as the Count of Artois", photo: "http://www.alex-bernardini.fr/histoire/images/charles-X_Vig.jpg", vitality: 0, deck: french_kings)
Card.create!(term: "Louis XVI", definition: "The last king of France before the fall of the monarchy during the French Revolution.", photo: "https://upload.wikimedia.org/wikipedia/commons/b/bc/Roslin_Louis_XVI_of_France.jpg", memo: "Louis croix V baton", vitality: 0, deck: french_kings)
Card.create!(term: "Louis XV", definition: "King of France from 1715 until in 1774. He succeeded his great-grandfather Louis XIV at the age of five", photo: "data:image/jpeg;base64,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", vitality: 0, deck: french_kings)
Card.create!(term: "Obelix", definition: "He likes to eat a lot of Pumbas", photo: "https://www.vodkaster.com/image-provider/article/9/0/0/4/900417_inline1_scale_450xauto.jpg", memo: "Poupée russe", vitality: 0, deck: french_kings)
Card.create!(term: "Henry IV", definition: "Also known as Henry the Great, was King of Navarre (as Henry III) from 1572 and King of France from 1589 to 1610", photo: "https://upload.wikimedia.org/wikipedia/commons/7/74/Henri-Pourbus.jpg", memo: "Cheval blanc", vitality: 0, deck: french_kings)


Card.create!(term: "Francis I", definition: "King of France from 1515 until 1547. He initiated the French Renaissance", photo: "https://www.histoire-pour-tous.fr/images/articles/dossiers/francois1er.jpg", vitality: 0, deck: french_kings)




