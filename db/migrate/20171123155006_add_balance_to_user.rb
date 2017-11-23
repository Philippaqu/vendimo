class AddBalanceToUser < ActiveRecord::Migration[5.1]
  def change
    add_monetize :users, :balance, currency: { present: false }
  end
end
