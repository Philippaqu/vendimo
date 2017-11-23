class AddValueToPayments < ActiveRecord::Migration[5.1]
  def change
    add_monetize :payments, :value, currency: { present: false }
    add_monetize :orders, :value
  end
end
