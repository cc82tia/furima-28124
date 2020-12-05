class Order < ApplicationRecord
  attr_accessor :item, :token
  belongs_to :user
  belongs_to :item
  has_one :address
end
