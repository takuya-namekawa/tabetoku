class Reserve < ApplicationRecord
  # has_many :billings, dependent: :destroy
  belongs_to :admin
  belongs_to :order
  attribute :hour
  attribute :minutes
  before_validation do
    self.visit = Time.zone.now.change(hour: self.hour, min: self.minutes)
  end
  # serialize :cart_data, Array
  def cart_data_hash
    eval("[" + self.cart_data.gsub("} {", "}, {") + "]")
  end
end
