class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :full_name
      t.string :address
      t.string :phone
      t.integer :payment_method
      t.integer :status
      t.decimal :total
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
