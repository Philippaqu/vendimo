class RemoveCurrencyFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :value_currency, :string
  end
end
