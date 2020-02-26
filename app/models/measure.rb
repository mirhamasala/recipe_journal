class Measure < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates_presence_of   :amount
  validates_uniqueness_of :recipe_id, scope: :ingredient_id,
                           message: "ingredient already exists"
end
