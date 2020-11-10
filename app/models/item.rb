class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :delivery_charge_id
  belongs_to_active_hash :delivery_source_id
  belongs_to_active_hash :days_of_ships_id
  
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :name,               presence: true, length: {maximum: 40, message: "40字以内にて入力して下さい"}  
    validates :description,        presence: true, length: {maximum: 1000, message:"1,000字以内にて入力して下さい"}
    validates :condition_id,       presence: true, numericality: { other_than: 1 } 
    validates :delivery_charge_id, presence: true, numericality: { other_than: 1 } 
    validates :delivery_source_id, presence: true, numericality: { other_than: 1 } 
    validates :days_of_ships_id,   presence: true, numericality: { other_than: 1 } 
    validates :price,              presence: true, length: {minimum: 300, max: 9999999, message: "販売価格は300円から9,999,999円の間で設定して下さい"}
    validates :category_id,        presence: true, numericality: { other_than: 1 } 
    validates :image,              presence: true
    validates :user_id,            presence: true
  end
 
end
