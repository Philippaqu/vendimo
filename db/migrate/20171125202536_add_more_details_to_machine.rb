class AddMoreDetailsToMachine < ActiveRecord::Migration[5.1]
  def change
    add_column :machines, :location_phone, :string
    add_column :machines, :location_install_date, :date
  end
end
