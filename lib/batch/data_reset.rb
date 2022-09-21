class Batch::DataReset
  def self.data_reset
    item_list = CartItem.where("updated_at <= ?", Time.now - 30.minutes)
    item_list.each do |cart_item|
      cart_item.item.update(inventory: (cart_item.item.inventory + cart_item.amount))
        if cart_item.item.inventory > 0  # 商品を取り消しで戻した際在庫数を戻す
          cart_item.item.update(is_ordered: true)
        end
      cart_item.destroy
    end
  end
end
