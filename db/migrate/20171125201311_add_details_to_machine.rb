class AddDetailsToMachine < ActiveRecord::Migration[5.1]
  def change
    add_column :machines, :model, :string
    add_column :machines, :firmware, :string
    add_column :machines, :manufacturer, :string
    add_column :machines, :serial_number, :string
    add_column :machines, :location_contact, :string
  end
end
