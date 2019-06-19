class Measure < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :amount, :unit, :ingredient, :recipe, presence: true, uniqueness: { scope: :ingredient }
end
