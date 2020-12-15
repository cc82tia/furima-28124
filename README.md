# furima-2812ER
<<img width="830" alt="20201023" src="https://user-images.githubusercontent.com/69379810/97004567-32f35a00-1578-11eb-907d-e72c7c5dc361.png">

# 画面遷移
![画面遷移](https://user-images.githubusercontent.com/69379810/96327115-8560e200-1071-11eb-8fba-62fda864564c.jpg)

# DB設計
## users table
 |Column|Type|Options|
 |:---|:---|:---|
 |nickname|string |null: false|
 |email|string|null: false|
 |password|string |null: false|
 |family_name|string|null: false|
 |first_name|string|null: false|
 |family_name_reading|string |null: false|
 |first_name_reading|string |null: false|
 |birthday|date|null: false|


 

### Association
- has_many:orders
- has_many:items
- has_many:comments
- has_many:reports
- has_many:favorites

 ## items table

 |Column|Type|Options|
 |:---|:---|:---|
 |name|string|null: false|
 |description|text|null: false|
 |condition_id|integer|null: false|
 |delivery_charge|integer|null: false|
 |delivery_source_id|integer|null: false|
 |days_of_ships_id|integer|null: false|
 |price|integer|null: false|
 |user_id|integer|foreign_key: true、null: false|
 |category_id|integer|null: false|

### Association
- belongs_to:user
- has_many:comments
- has_many:reports
- has_many:favorite
- has_one:order

## addresses table
|Column|Type|Options|
|:---|:---|:---|
|postal_code|string|null: false|
|delivery_source_id| integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_number|string|
|phone_number|string|null: false|
|order_id|integer|null: false, foreign_key: true|

### Association
- belongs_to:order


## orders table
|Column|Type|Options|
|:---|:---|:---|
|user_id|references|foreign_key: true, null: false|
|item_id|references|foreign_key: true, null:false|

### Association
- belongs_to:user
- belongs_to:item
- has_one:address

## comments table
|Column|Type|Options|
|:---|:---|:---|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to:user
- belongs_to:item

## favorites table
|Column|Type|Options|
|:---|:---|:---|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to:user
_ belongs_to:item

## reports table
|Column|Type|Options|
|:---|:---|:---|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to:user
_ belongs_to:item
