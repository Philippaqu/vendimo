class Company < ApplicationRecord
  has_many :machines, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  monetize :balance_cents

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def adjust_price(amount)
    self.balance_cents = self.balance_cents + amount
    self.save
  end

end
