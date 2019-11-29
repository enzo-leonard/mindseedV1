class Theme < ApplicationRecord
  belongs_to :user
  has_many :decks
  has_many :cards, through: :decks
end
