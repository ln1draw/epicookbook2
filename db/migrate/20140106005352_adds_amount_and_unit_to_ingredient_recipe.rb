class AddsAmountAndUnitToIngredientRecipe < ActiveRecord::Migration
  def change
    add_column :ingredient_recipes, :amount, :string
    add_column :ingredient_recipes, :unit, :string
  end
end
