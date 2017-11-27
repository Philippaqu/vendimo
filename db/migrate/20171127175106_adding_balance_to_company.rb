class AddingBalanceToCompany < ActiveRecord::Migration[5.1]
  def change
    add_monetize :companies, :balance, currency: { present: false }
  end
end
