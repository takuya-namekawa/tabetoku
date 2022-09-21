class Public::ItemCommentsController < ApplicationController
  before_action :user_authenticate

  def create
    item = Item.find(params[:item_id])
    comment = current_customer.item_comments.new(item_comments_params)
    comment.item_id = item.id
    if comment.save
      redirect_to item_path(item), notice: "クチコミを投稿しました"
    else
      @item = item
      @cart_item = @item.cart_items
      @item_inventory = []
      for i in 1..@item.inventory
        @item_inventory.push(i)
      end
      @item_comment = comment
      render "public/items/show"
    end
  end

  def destroy
    ItemComment.find(params[:id]).destroy
    redirect_to  item_path(params[:item_id]), notice: "クチコミを削除しました"
  end

  private
    def user_authenticate
      if customer_signed_in? || admin_signed_in?
      else
        redirect_to root_path
      end
    end

    def item_comments_params
      params.require(:item_comment).permit(:comment, :star)
    end
end
