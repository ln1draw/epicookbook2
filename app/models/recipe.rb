class Recipe < ActiveRecord::Base
  has_many :users, through: :user_recipes
  has_many :ingredients, through: :ingredient_recipes
end
