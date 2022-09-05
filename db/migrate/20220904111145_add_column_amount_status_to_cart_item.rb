class AddColumnAmountStatusToCartItem < ActiveRecord::Migration[6.1]
  def change
   add_column :cart_items, :amount_status, :boolean, default: false, null: false
  end
end
