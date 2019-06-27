class Ingredient < ApplicationRecord
  has_many :measures
  has_many :recipes, through: :measures
  validates :name, presence: true, uniqueness: true
  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
  end
end
