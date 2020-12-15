class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_id, :city, :house_number, 
  :building_number, :phone_number,:user_id , :item_id, :token
  
  with_options presence: true do
    validates :postal_code,         format:{ with: /\d{3}-\d{4}/, messeage:"を入力してください。Postal codeは不正な値です"}
    validates :delivery_source_id,  numericality: { other_than: 0, message:"は--以外を選択して下さい"} 
    validates :city
    validates :house_number
    validates :phone_number,        format:{ with:/\A\d{10,11}\z/,messeage:"はハイフン無しの10桁若しくは11桁にして下さい"}
    validates :token
  end

  def save
    order = Order.create(item_id:item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code, 
      delivery_source_id: delivery_source_id, 
      city: city, 
      house_number: house_number, 
      building_number: building_number,
      phone_number: phone_number,
      order_id: order.id)
  end
end