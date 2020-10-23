# furima-2812ER
<img width="839" alt="1023ER" src="https://user-images.githubusercontent.com/69379810/96999452-20752280-1570-11eb-9513-24b8a06e69fb.png">


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
 |month_of_birth|integer |null: false|
 |day_of_birth|integer|null: false|
 

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
 |description_id|text|null: false|
 |condition_id|integer|null: false|
 |delivery_charge|integer|null: false|
 |delivery_source_id|integer|null: false|
 |days_of_ships_id|integer|null: false|
 |price|integer|null: false|
 |user_id|integer|foreign_key: true|
 |category_id|integer|null: false|

### Association
- belongs_to:user
- has_many:comments
- has_many:reports
- has_many:favorite

## addresses table

|Column|Type|Options|
|:---|:---|:---|
|postal_code|string|null: false|
|prefecture| integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_number|string|
|phone_number|string|null: false|
|order_id|integer|null: false|

### Association
- belongs_to:order


## orders table
|Column|Type|Options|
|:---|:---|:---|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to:user
- belongs_to:item


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





# Note
 
-iosやandroidのアプリには対応していない
 
# Author

* 作成者 28124
* 所属   テックキャンプ 夜間online81期生
