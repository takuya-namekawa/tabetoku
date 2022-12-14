class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :payment_method, null: false, default: 0
      t.timestamps
    end
  end
end
