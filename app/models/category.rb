class Category < ApplicationRecord
  has_many :machines, through: :machine_categories
  validates :name, presence: true
end

