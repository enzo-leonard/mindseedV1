class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.integer :vitality
      t.string :name
      t.boolean :is_public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
