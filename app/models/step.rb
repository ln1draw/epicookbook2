class Step < ActiveRecord::Base
  belongs_to :recipe

  def initialize(step)
    self.step_description = step
    self.save
  end
end
