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


user = User.create!(username: "admin", password: "password", email: "admin@gmail.com", first_name: "Enza", avatar: "https://images.unsplash.com/photo-1546538994-4f15d0aa966f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60")
user2 = User.create!(username: "toto", password: "password", email: "toto@gmail.com")

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
  vitality: 100,
  definition: "To suffer",
  deck: irr,
  context: "I said I would abide by their decision",
  memo: "avoir du bide ça fait souffire",
  photo: "https://source.unsplash.com/random"
)

Card.create!(
  term: "Beget",
  vitality: 100,
  definition: "engendrer",
  deck: irr,
  context: "they hoped that the King might beget an heir by his new queen",
  memo: "",
  photo: "https://source.unsplash.com/random"
)


Card.create!(
  term: "Bereave",
  vitality: 100,
  definition: "scold or criticize (someone) angrily.",
  deck: irr,
  context: "she berated herself for being fickle",
  memo: "",
  photo: "https://source.unsplash.com/random"
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
  vitality: 100,
  definition: "goddess of wars",
  deck: god,
  context: "Athena !",
  memo: "Athena as the grece capital",
  photo: "https://source.unsplash.com/random"
)

Card.create!(
  term: "Apollo",
  vitality: 100,
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


def printChild(parent)
  parent.childs.each do |child|
    puts " #{"-"*child.rank} (#{child.cards.count})"                                                                                                                                                                                                                                                                          +child.name
    printChild(child) if child.childs
  end
end


puts "liste des thèmes : \n\n"

# themes = Theme.all
# themes.each do |t|
#   puts "\n\n--------------\nTheme : #{t.name}\n-------------\n\n"
#   t.decks.each do |x|
#     puts "- "+x.name  if x.rank == 1
#     printChild(x) if x.rank == 1
#   end
# end


def card_child(array, done, count)
      array.each do |item|
        if !done.include?(item)
            done << item

            item.cards.each do |card|
            count << card
            puts card.term
            end

          card_child(item.childs, done, count) if item.childs
        else

        end

        end
        count
    end

    def card_theme(theme)
      done = []
      count = []
      count << card_child(theme.decks, done, count)
    end

     def card_theme_vitality(theme)
      done = []
      vita = 0
      vita += card_child_vitality(theme.decks, done, vita)
      card_theme(theme).count == 0 ? nb = card_theme(theme).count : nb = 1
      vitality = vita / nb
      puts "#{vitality} - #{nb}"

    end

    def card_child_vitality(array, done, vita)
      array.each do |item|
        if !done.include?(item)
          item.cards.each do |card|
            vita += card.vitality
          end

          card_child_vitality(item.childs, done, vita) if item.childs
         end
        end
        vita

    end


puts "\n -- nombre de card du theme anglais : " + card_theme(english).count.to_s
puts "vita : " + card_theme_vitality(english).to_s
