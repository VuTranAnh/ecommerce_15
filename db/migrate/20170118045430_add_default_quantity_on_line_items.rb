class AddDefaultQuantityOnLineItems < ActiveRecord::Migration[5.0]
  def change
    change_column :line_items, :quantity, :integer, default: 0
  end
end
