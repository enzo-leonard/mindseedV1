class CreateCardTests < ActiveRecord::Migration[6.0]
  def change
    create_table :card_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
