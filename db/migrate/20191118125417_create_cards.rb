class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :term
      t.text :definition
      t.string :context
      t.string :photo
      t.date :date_last_test
      t.integer :number_of_test
      t.integer :vitality
      t.string :memo

      t.timestamps
    end
  end
end
