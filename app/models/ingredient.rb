class Ingredient < ApplicationRecord
  has_many :measures
  validates :name, presence: true, uniqueness: true
end
