class Measure < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :amount, presence: true
  validates :recipe, uniqueness: { scope: :ingredient }
end
