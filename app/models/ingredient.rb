class Ingredient < ApplicationRecord
  has_many :measures
  has_many :recipes, through: :measures
  validates :name, presence: true, uniqueness: true

  def self.alphabetize
    order(name: :asc)
  end
end
