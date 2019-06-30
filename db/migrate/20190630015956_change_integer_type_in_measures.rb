class ChangeIntegerTypeInMeasures < ActiveRecord::Migration[5.2]
  def change
    change_column :measures, :amount, :float
  end
end
