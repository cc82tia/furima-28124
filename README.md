# furima-2812ER
<img width="393" alt="ER図改" src="https://user-images.githubusercontent.com/69379810/96337039-c9c69f00-10be-11eb-9ac5-0a05033356ce.png">


# 画面遷移
![画面遷移](https://user-images.githubusercontent.com/69379810/96327115-8560e200-1071-11eb-8fba-62fda864564c.jpg)

# ER
![furima_er](https://user-images.githubusercontent.com/69379810/96720652-fee82f80-13e5-11eb-986e-1e591e8e4e75.png)

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
 |year_of_birth|integer|null: false|
 |month_of_birth|integer |null: false|
 |day_of_birth|integer|null: false|
 |item_id|references|foreign_key: true|
 |favorite_id|references|foreign_key: true|
 |report_id|references|foreign_key: true|
 |comment_id|references|foreign_key: true|
 

### Association
- has_many:items
- has_many:orders
- has_many:addresses
- has_many:comments
- has_many:reports
- has_many:favorites

 ## items table

 |Column|Type|Options|
 |:---|:---|:---|
 |name|string|null: false|
 |description|text|null: false|
 |condition|integer|null: false|
 |delivery_charge|integer|null: false|
 |delivery_source|integer|null: false|
 |days_of_ships|integer|null: false|
 |price|integer|null: false|
 |user_id|integer|foreign_key: true|
 |category_id|references|foreign_key: true|
 |report_id|references|foreign_key: true|
 |comment_id|references|foreign_key: true|
 |favorite_id|references|foreign_key: true|
 |address_id|references|foreign_key: true|
 |order_id|references|foreign_key: true|



### Association
- belongs_to:user
- has_one:category
- has_one:address
- has_one:order
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
|phone_number|integer|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|order_id|references|foreign_key: true|

### Association
- belongs_to:item
- belongs_to:user
- has_one:order


## orders table
|Column|Type|Options|
|:---|:---|:---|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|order_address_id|references|foreign_key: true|

### Association
- belongs_to:user
- belongs_to:item
- belongs_to:address

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

## categories table
|Column|Type|Options|
|:---|:---|:---|
|name|integer|null: false|
|item_id|references|foreign_key: true|

### Association
_ has_many:items


# Note
 
-iosやandroidのアプリには対応していない
 
# Author

* 作成者 28124
* 所属   テックキャンプ 夜間online81期生
