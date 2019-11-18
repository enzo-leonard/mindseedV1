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



def printChild(parent)
  parent.childs.each do |child|
    puts " #{"-"*child.rank}"                                                                                                                                                                                                                                                                          +child.name
    printChild(child) if child.childs
  end
end


puts "liste des thèmes : \n\n"
anglais.decks.each do |x|
  puts "- "+x.name  if x.rank == 1
  printChild(x) if x.rank == 1
  #puts "- #{x.name} (#{x.parent ? x.parent.name : "primary"}, #{x.childs.count})"
end


