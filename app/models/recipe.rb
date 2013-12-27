class Recipe < ActiveRecord::Base
  has_many :users, through: :user_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_many :steps
  has_many :ingredient_recipes

  def add_ingredients(ingredients_param)
    ingredients_param.each do |ingredient_id|
      next if ingredient_id.to_i == 0
      ingredient = Ingredient.find(ingredient_id.to_i)
      self.ingredients << ingredient
    end
  end
end
