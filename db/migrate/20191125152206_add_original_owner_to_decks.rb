class AddOriginalOwnerToDecks < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :original_owner, :boolean, :default => false
  end
end
