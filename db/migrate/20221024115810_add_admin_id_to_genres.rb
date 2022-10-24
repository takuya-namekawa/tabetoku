class AddAdminIdToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :admin_id, :integer
  end
end
