class AddScoreToItemComments < ActiveRecord::Migration[6.1]
  def change
    add_column :item_comments, :score, :decimal, precision: 5, scale: 3 ,default: 0
  end
end
