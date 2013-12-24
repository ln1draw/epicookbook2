class User < ActiveRecord::Base
  has_many :recipes, through: :user_recipes
  has_many :filters
end
