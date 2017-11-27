class Order < ApplicationRecord
  belongs_to :item, dependent: :destroy
  belongs_to :machine
  belongs_to :user

  validate :check_price
  after_create :update_relations_prices

  def update_relations_prices
    item_price = self.item.price_cents # getting the price of the order's item

    if self.user.check_balance(item_price) && self.item.check_item[:response]
      self.user.adjust_price(item_price)
      # company balance
    end
  end

private
  def check_price
    item_price = self.item.price_cents # getting the price of the order's item

    unless self.user.check_balance(item_price) && self.item.check_item[:response]
      errors.add(:balance, "Not enough balance")
    end
  end
end




# find corresponding item
# find price of corresponding item
# check if user balance is greater than item price
# if enough balance substract item price from user balance and add to company balance
# else show message that more balance required and redirect
