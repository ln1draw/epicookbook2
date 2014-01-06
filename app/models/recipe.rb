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

  def get_ingredient_recipe(ingredient_id)
    @ingredient_recipe = IngredientRecipe.where(recipe_id: self.id, ingredient_id: ingredient_id)
  end

  def get_amount_and_unit(ingredient_id)
    get_ingredient_recipe(ingredient_id)
    return [@ingredient_recipe[0].amount, @ingredient_recipe[0].unit]
  end

  def set_amount_and_unit(ingredient_id, amount, unit)
    get_ingredient_recipe(ingredient_id)
    IngredientRecipe.update(@ingredient_recipe[0], amount: amount, unit: unit)
  end

  def self.filter(dietary_restrictions = nil, search_term = nil)
    @filter = [dietary_restrictions, search_term].flatten
    if dietary_restrictions
      by_dietary_restrictions(dietary_restrictions)
    elsif search_term 
      find(:all, :conditions => ['name LIKE ?', "%#{search_term}%"])
    end
  end
end
