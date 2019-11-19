# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or saved alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Deck.destroy_all
Theme.destroy_all
User.destroy_all

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



batch = Theme.create!(name: "batch 308", user: user)
ruby = Deck.create!(name: "Ruby", rank: 1, parent: nil, theme: batch)
ruby_1 = Deck.create!(name: "Programming basic", rank: 2, parent: ruby, theme: batch)
ruby_1_2 = Deck.create!(name: "Variable", rank: 3, parent: ruby_1, theme: batch)
ruby_2 = Deck.create!(name: "Flow Conditionnal & array", rank: 2, parent: ruby, theme: batch)
ruby_3 = Deck.create!(name: "Iterator & blocks", rank: 2, parent: ruby, theme: batch)
ruby_4 = Deck.create!(name: "Hash & Symbols", rank: 2, parent: ruby, theme: batch)
ruby_5 = Deck.create!(name: "Regular Expressions", rank: 2, parent: ruby, theme: batch)
ruby_6 = Deck.create!(name: "Parsing", rank: 2, parent: ruby, theme: batch)
oop = Deck.create!(name: "Oriented Object programming", rank: 1, parent: nil, theme: batch)
db = Deck.create!(name: "Base de donnée", rank: 1, parent: nil, theme: batch)
front = Deck.create!(name: "Front", rank: 1, parent: nil, theme: batch)
rails = Deck.create!(name: "Rails", rank: 1, parent: nil, theme: batch)





def printChild(parent)
  parent.childs.each do |child|
    puts " #{"-"*child.rank}"                                                                                                                                                                                                                                                                          +child.name
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


