class ItemComment < ApplicationRecord
  belongs_to :item
  belongs_to :customer
end
