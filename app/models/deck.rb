class Deck < ApplicationRecord
  belongs_to :theme
  has_many :childs, class_name: "Deck", foreign_key: :parent_id
  belongs_to :parent, optional: true, class_name: "Deck", foreign_key: :parent_id
end
