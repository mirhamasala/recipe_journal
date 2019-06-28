class Recipe < ApplicationRecord
  belongs_to :user
  has_many :measures, dependent: :destroy
  has_many :ingredients, through: :measures
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
