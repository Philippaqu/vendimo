class Item < ApplicationRecord
  belongs_to :order
  validates :number, presence: true
  validates :price, presence: true

  def check_item
    if self.number.nil?
      return {
        response: true,
        message: "Number doesn't exist"
      }
    elsif self.availability == true
      return {
        price:  price_cents
       }
      else
        return {
          response: false,
          message: "Out of stock"
        }
      end
    end
  end
