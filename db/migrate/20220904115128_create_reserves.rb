class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.integer :customer_id, null: false
      t.integer :admin_id, null: false
      t.integer :visit, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.boolean :visit_status, null: false, default: true


      t.timestamps
    end
  end
end
