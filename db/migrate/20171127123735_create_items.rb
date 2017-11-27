class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :number
      t.monetize :price
      t.boolean :availability

      t.timestamps
    end
  end
end
