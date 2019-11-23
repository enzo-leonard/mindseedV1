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


user = User.create!(username: "admin", password: "password", email: "admin@gmail.com")

puts "Creation du theme anglais"

user = User.first

anglais = Theme.new(name: "Anglais")
anglais.user = user
anglais.save

verb = Deck.create!(
  name: "Verbe",
  theme: anglais,
  rank: 1,
  parent: nil)

nom = Deck.create!(
  name: "Nom",
  rank: 1,
  parent: nil,
  theme: anglais)

expression = Deck.create!(
  name: "Expression",
  rank: 1,
  parent: nil,
  theme: anglais)

first = Deck.create!(
  name: "First_group",
  rank: 2,
  parent: verb,
  theme: anglais)

second = Deck.create!(
  name: "Second_group",
  rank: 2,
  parent: verb,
  theme:anglais)

reg = Deck.create!(
  name: "regulier",
  rank: 3,
  parent: second,
  theme: anglais)

irr = Deck.create!(
  name: "irrégulier",
  rank: 3,
  parent:  second,
  theme:  anglais)

Card.create!(
  term: "abide",
  definition: "souffrire",
  deck: irr,
  context: "I said I would abide by their decision",
  memo: "avoir du bide ça fait souffire",
  photo: "https://source.unsplash.com/random"
)

Card.create!(
  term: "beget",
  definition: "engendrer",
  deck: irr,
  context: "they hoped that the King might beget an heir by his new queen",
  memo: "",
  photo: "https://source.unsplash.com/random"
)


Card.create!(
  term: "bereave",
  definition: "scold or criticize (someone) angrily.",
  deck: irr,
  context: "she berated herself for being fickle",
  memo: "",
  photo: "https://source.unsplash.com/random"
)


learn = Theme.create!(name: "How we learn", user: user)
brain = Deck.create!(name: "neuroscience", rank: 1, parent: nil, theme: learn)


full_stack = Theme.create!(name: "Full Stack", user: user)


ruby = Deck.create!(name: "Ruby", rank: 1, parent: nil, theme: full_stack)
ruby_1 = Deck.create!(name: "Programming basic", rank: 2, parent: ruby, theme: full_stack)
ruby_1_2 = Deck.create!(name: "Variable", rank: 3, parent: ruby_1, theme: full_stack)
ruby_2 = Deck.create!(name: "Flow Conditionnal & array", rank: 2, parent: ruby, theme: full_stack)
ruby_3 = Deck.create!(name: "Iterator & blocks", rank: 2, parent: ruby, theme: full_stack)
ruby_4 = Deck.create!(name: "Hash & Symbols", rank: 2, parent: ruby, theme: full_stack)
ruby_5 = Deck.create!(name: "Regular Expressions", rank: 2, parent: ruby, theme: full_stack)
ruby_6 = Deck.create!(name: "Parsing", rank: 2, parent: ruby, theme: full_stack)
oop = Deck.create!(name: "Oriented Object programming", rank: 1, parent: nil, theme: full_stack)
db = Deck.create!(name: "Base de donnée", rank: 1, parent: nil, theme: full_stack)
front = Deck.create!(name: "Front", rank: 1, parent: nil, theme: full_stack)
rails = Deck.create!(name: "Rails", rank: 1, parent: nil, theme: full_stack)



history = Theme.create!(name: "History", user: user)
greek = Deck.create!(name: "Greek mythology", rank: 1, parent: nil, theme: history)
god = Deck.create!(name: "God", rank: 2, parent: greek, theme: history)
demigod = Deck.create!(name: "DemiGod", rank: 2, parent: greek, theme: history)
titan = Deck.create!(name: "Titant", rank: 2, parent: greek, theme: history)
creature = Deck.create!(name: "Creature", rank: 2, parent: greek, theme: history)

Card.create!(
  term: "Athena",
  definition: "goddess of wars",
  deck: god,
  context: "Athena !",
  memo: "Athena as the grece capital",
  photo: "https://source.unsplash.com/random"
)

Card.create!(
  term: "Apollo",
  definition: "",
  deck: god,
  context: "Athena !",
  memo: "Athena as the grece capital",
  photo: "https://source.unsplash.com/random"
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

english = Theme.create!(name: "English", user: user)

geo = Theme.create!(name: "Geographie", user: user)
capital = Deck.create!(name: "Capital", rank: 1, parent: nil, theme: geo)
afrique = Deck.create!(name: "Afrique", rank: 2, parent: capital, theme: geo)
am_sud = Deck.create!(name: "South america", rank: 2, parent: capital, theme: geo)
am_nord = Deck.create!(name: "North america", rank: 2, parent: capital, theme: geo)
euro = Deck.create!(name: "Europe", rank: 2, parent: capital, theme: geo)
asie = Deck.create!(name: "Asie", rank: 2, parent: capital, theme: geo)



addCard(euro, "Paris", "French" )
addCard(euro, "Madrid", "Spain" )
addCard(euro, "Rome", "Italie" )
addCard(euro, "London", "French" )
addCard(euro, "Paris", "French" )
addCard(euro, "Paris", "French" )
addCard(euro, "Paris", "French" )
addCard(euro, "Paris", "French" )
addCard(euro, "Paris", "French" )
addCard(euro, "Paris", "French" )

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


