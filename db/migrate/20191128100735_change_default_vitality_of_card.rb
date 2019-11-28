class ChangeDefaultVitalityOfCard < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :vitality, :integer, default: 0
  end
end
