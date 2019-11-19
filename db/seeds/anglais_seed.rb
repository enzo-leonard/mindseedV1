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

