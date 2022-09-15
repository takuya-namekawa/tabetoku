class ItemComment < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  validates :comment,presence:true,length:{maximum:200}

end
