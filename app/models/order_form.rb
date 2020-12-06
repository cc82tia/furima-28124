class ItemOrder

  # include ActiveModel::ActiveModel
  # attr_accessor :postal_code, :delivery_source_id, :city, :house_number, :building_name, :user_id , :item_id
  
  # with_options presence: true do
  #   validates :postal_code
  #   validates :delivery_source_id, numericality: { other_than: 0, message: "can't be 0" }
  #   validates :city
  #   validates :house_number
  #   validates :phone_number,  {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # end

  # def save
  #   Address.create(postal_code: postal_code, delivery_source_id: delivery_source_id city: city, house_number: house_number, building_name: building_name,user_id: user.id,item_id: item_id)
    
  # end
end
