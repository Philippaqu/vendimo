class AddingAndRemovingFromOrderMode < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :user, foreign_key: true, index: true
    add_reference :orders, :machine, foreign_key: true, index: true
    add_reference :orders, :item, foreign_key: true, index: true


    remove_column :orders, :state, :string
    remove_column :orders, :value_cents, :integer
    remove_column :orders, :payment_id, :bigint
  end
end
