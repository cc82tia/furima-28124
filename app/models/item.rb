class Item < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
    validates :name,               presence: true, length: {maximum: 40, message: "40字以内にて入力して下さい"}  
    validates :description,        presence: true, length: {maximum: 1000, message:"1,000字以内にて入力して下さい"}
    validates :condition_id,       presence: true
    validates :delivery_charge,    presence: true
    validates :delivery_source_id, presence: true
    validates :days_of_ships_id,   presence: true
    validates :price,              presence: true, length: {minimum: 300, max: 9999999, message: "販売価格は300円から9,999,999円の間で設定して下さい"}
    validates :category,           presence: true
    validates :image,              presence: true
  end
end
