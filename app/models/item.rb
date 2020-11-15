class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :days_of_ships

  
  
  belongs_to :user

  has_one_attached :image
  
  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :name,               presence: true, length: {maximum: 40, message: "40字以内にて入力して下さい"}  
    validates :description,        presence: true, length: {maximum: 1000, message:"1,000字以内にて入力して下さい"}
    validates :condition_id,       presence: true, numericality: { other_than: 1 } 
    validates :delivery_charge_id, presence: true, numericality: { other_than: 1 } 
    validates :delivery_source_id, presence: true, numericality: { other_than: 0 } 
    validates :days_of_ships_id,   presence: true, numericality: { other_than: 1 } 
    validates :price,              presence: true, numericality: {
      :greater_than_or_equal_to => 333,
      :less_than_or_equal_to => 9999999, message: "販売価格は300円から9,999,999円の間で設定して下さい"}
    validates :category_id,        presence: true, numericality: { other_than: 1 } 
    validates :user_id,            presence: true
  end
 
end
