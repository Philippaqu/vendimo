class Company < ApplicationRecord
  has_many :machines, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
