class Machine < ApplicationRecord
  belongs_to :companies
  has_many :categories, through: :machine_categories
  validates :address, presence: true
  has_attachment :building_photo
  has_attachment :machine_photo
end
