class Measure < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :amount, :unit, presence: true
  validates :recipe, uniqueness: { scope: :ingredient }
end
