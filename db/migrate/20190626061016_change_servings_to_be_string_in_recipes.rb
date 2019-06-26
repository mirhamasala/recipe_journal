class ChangeServingsToBeStringInRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :servings, :string
  end
end
