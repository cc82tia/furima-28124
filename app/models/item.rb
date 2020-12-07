class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :days_of_ships

  belongs_to :user
  has_one :order
  has_one_attached :image
  
  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :name,                length: {maximum: 40, message: "は40字以内にて入力して下さい"} 
    validates :description,         length: {maximum: 1000, message:"は1,000字以内にて入力して下さい"}
    validates :condition_id,        numericality: { other_than: 1, message:"は--以外を選択して下さい"}
    validates :delivery_charge_id,  numericality: { other_than: 1, message:"は--以外を選択して下さい"} 
    validates :delivery_source_id,  numericality: { other_than: 0, message:"は--以外を選択して下さい"} 
    validates :days_of_ships_id,    numericality: { other_than: 1, message:"は--以外を選択して下さい"} 
    validates :price,               numericality: { only_integer: true, 
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999 , message: "は300円から9,999,999円の間で設定して下さい"}
    validates :category_id,         numericality: { other_than: 1, message:"は--以外を選択して下さい"}
    validates :image  
  end
end