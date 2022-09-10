class Public::ItemCommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    comment = current_customer.item_comments.new(item_comments_params)
    comment.item_id = item.id
    comment.save
    redirect_to  item_path(item)
  end

  def destroy
    ItemComment.find(params[:id]).destroy
    redirect_to  item_path(params[:item_id])
  end

  private

  def item_comments_params
    params.require(:item_comment).permit(:comment, :star)
  end

end
