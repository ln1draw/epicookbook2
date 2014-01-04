class User < ActiveRecord::Base
  validates_presence_of :password, :on => :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, through: :user_recipes

  validates :username, presence: true
end
