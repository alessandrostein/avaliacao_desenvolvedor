class CreateSaleItems < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_items do |t|
      t.string :buyer
      t.string :description
      t.decimal :price
      t.integer :amount
      t.string :address
      t.string :vendor
      t.belongs_to :sale
      t.timestamps
    end
  end
end
