class Recipe < ApplicationRecord
  has_many :measures, dependent: destroy
  has_many :ingredients, through :measures
end
