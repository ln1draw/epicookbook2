class User < ActiveRecord::Base
  validates_presence_of :password, :on => :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, through: :user_recipes
  has_many :dietary_restrictions
  validates :username, presence: true

  def find_recipes
    Recipe.where(user_id: self.id)
  end
end
