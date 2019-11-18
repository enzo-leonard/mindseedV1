class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.integer :vitality
      t.integer :rank
      t.string :name
      t.string :description
      t.references :theme, null: false, foreign_key: true
      t.integer :stars
      t.boolean :is_private
      t.integer :parent_id

      t.timestamps
    end
  end
end
