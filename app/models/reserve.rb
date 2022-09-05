class Reserve < ApplicationRecord
  belongs_to :customer
  has_many :billings, dependent: :destroy
  belongs_to :admin
  
  enum payment_method: { cash: 0, credit_card: 1, transportation_money: 2, barcode: 3 }
end
