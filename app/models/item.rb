class Item < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :number, presence: true
  validates :price_cents, presence: true
  monetize :price_cents

  def check_item
    if self.number.nil?
      errors.add(:number, "Number doesn't exist")
      return {
        response: false,
        message: "Number doesn't exist"
      }
    elsif self.availability == true && !self.number.nil?
      errors.add(:availability, "Number availability")
      return {
        response: true,
        price:  price_cents
       }
      else
        errors.add(:availability, "out of stock")
        return {
          response: false,
          message: "Out of stock"
        }
      end
    end
  end
