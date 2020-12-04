class Order < ApplicationRecord
 belongs_to :item_id
 belongs_to :user_id
 has_one :address
end
