class AddStepsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :steps, :array
  end
end
