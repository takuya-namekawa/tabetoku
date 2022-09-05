class AddVisitTimeToReserves < ActiveRecord::Migration[6.1]
  def change
    add_column :reserves, :visit_time, :time
  end
end
