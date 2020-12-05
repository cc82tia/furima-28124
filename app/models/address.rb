class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_source

  belongs_to :order

  with_options presence: true do
    validates :postal_code #電話番号にはハイフンは不要で、11桁以内であること
    validates :delivery_source_id
    validates :city
    validates :house_number
    validates :building_number
    validates :phone_number
  end

end
