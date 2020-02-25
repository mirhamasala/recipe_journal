class Ingredient < ApplicationRecord
  has_many :measures
  has_many :recipes, through: :measures
  validates :name, presence: true, uniqueness: true
  before_save { name.downcase! }

  def self.alphabetize
    order(name: :asc)
  end
end
