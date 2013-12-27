class FixesStupidBs < ActiveRecord::Migration
  def change
    remove_column :recipes, :description
    remove_column :recipes, :image
    add_column :recipes, :description, :text
    add_column :recipes, :image, :string

    remove_column :ingredient_recipes, :ingredient_id
    remove_column :ingredient_recipes, :recipe_id
    add_column :ingredient_recipes, :ingredient_id, :integer
    add_column :ingredient_recipes, :recipe_id, :integer

    remove_column :user_recipes, :user_id
    remove_column :user_recipes, :recipe_id
    add_column :user_recipes, :user_id, :integer
    add_column :user_recipes, :recipe_id, :integer

    add_column :steps, :step_description, :text
  end
end
