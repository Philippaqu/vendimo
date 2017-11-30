class AddingLastMaintenanceToMachines < ActiveRecord::Migration[5.1]
  def change
    add_column :machines, :last_maintenance, :date
  end
end
