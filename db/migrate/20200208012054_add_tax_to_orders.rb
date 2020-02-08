class AddTaxToOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_classes do |t|
      t.string :name
      t.float :rate, default: 0
    end

    add_column :products, :tax_class_id, :integer
  end
end
