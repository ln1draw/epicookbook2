class DietaryRestriction < ActiveRecord::Base
  has_many :users, through: :dr_users
end

