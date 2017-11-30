class ChangingDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :machines, :last_maintenance, :date
    add_column :machines, :last_maintenance, :string
  end
end
