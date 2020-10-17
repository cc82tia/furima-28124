# furima-2812ER
<img width="393" alt="ER図改" src="https://user-images.githubusercontent.com/69379810/96337039-c9c69f00-10be-11eb-9ac5-0a05033356ce.png">


# 画面遷移
![画面遷移](https://user-images.githubusercontent.com/69379810/96327115-8560e200-1071-11eb-8fba-62fda864564c.jpg)

# DB設計
## userstable
 |Column|Type|Options|
 |:---|:---|:---|
 |nickname|string |null: false|
 |email|string|null: false|
 |password|string |null: false|
 |name|string|null: false|
 |name_reading|string |null: false|
 |date_of_birth|string |null: false|

### Association
- has_many:item

 ## itemstable

 |Column|Type|Options|
 |:---|:---|:---|
 |item_image|binary|null:false|
 |item_name|string|null: false|
 |description_item|text|null: false|
 |item_condition|integer|null: false|
 |delivery_charge|integer|null: false|
 |delivery_sorce|integer|null: false|
 |days_of_ships|integer|null: false|
 |price|numeric|null: false|


### Association
- belongs_to:user
- has_one:orderaddress

## orderaddresstable

|Column|Type|Options|
|:---|:---|:---|
|postal_code|string|null: false|
|prefecture| integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_number|string|null: false|
|phone_number|integer|null: false|

### Association
- belongs_to:item
 
# Note
 
-iosやandroidnのアプリには対応していない
 
# Author

* 作成者 28124
* 所属   テックキャンプ 夜間online81期生