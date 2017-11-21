class AddingNameToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :name, :string
  end
end
