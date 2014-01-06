class User < ActiveRecord::Base
  validates_presence_of :password, :on => :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, through: :user_recipes
  has_many :user_recipes
  has_many :dietary_restrictions, through: :dr_users
  validates :username, presence: true

  def find_recipes
    Recipe.where(user_id: self.id)
  end

  def add_recipe(recipe_id)
    self.recipes << Recipe.find(recipe_id)
    self.save
  end
end
