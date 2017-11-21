class AddingCompanyIdToMachine < ActiveRecord::Migration[5.1]
  def change
    add_reference :machines, :company, foreign_key: true, index: true
  end
end
