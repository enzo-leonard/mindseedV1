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

theme = Theme.new(name: "Anglais")
theme.user = user
theme.save

verb = Deck.new(name: "Verbe")
verb.theme = theme
verb.parent = nil
verb.save!

nom = Deck.new(name: "Nom")
nom.parent = nil
nom.theme = theme
nom.save!

first = Deck.new(name: "First_group")
first.parent = verb
first.theme = theme
first.save!

second = Deck.new(name: "Second_group")
second.parent = verb
second.theme = theme
second.save!

reg = Deck.new(name: "regulier")
reg.parent = second
reg.theme = theme
reg.save!

irr = Deck.new(name: "irrégulier")
irr.parent = second
irr.theme = theme
irr.save!

second.childs.each { |x| p x.parent.parent.name }
