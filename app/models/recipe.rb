class Recipe < ApplicationRecord
  has_many :measures, dependent: :destroy
  has_many :ingredients, through: :measures
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
