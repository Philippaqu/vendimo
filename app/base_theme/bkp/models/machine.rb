class Machine < ApplicationRecord
  has_many :categories, through: :machine_categories
  validates :address, presence: true
end
