# furima-2812ER
<img width="293" alt="ER図" src="https://user-images.githubusercontent.com/69379810/96332656-4dbd5e80-10a0-11eb-967a-bfd991024819.png">

# 画面遷移
![画面遷移](https://user-images.githubusercontent.com/69379810/96327115-8560e200-1071-11eb-8fba-62fda864564c.jpg)

# DB設計
## userstable
 |Column|Type|Options|
 |:---|:---|:---|
 |user_id|bigint|null: false, foreign_key: true|
 |nickname|string |null: false, format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/}|
 |mail_address|string|null: false, unique: true, /\A\S+@\S+\.\S+\z/|
 |password|string |null: false, length: { minimum: 6 }, format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/}||
 |name|string|null: false, format:{with:[^ -~｡-ﾟ]}|
 |name_reading|string |null: false, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}|
 |date_of_birth|string |null: false|

### Association
- has_many:item

 ## itemstable

 |Column|Type|Options|
 |:---|:---|:---|
 |item_id|bignit|null: false, foreign_key: true|
 |image_name|binary|null:false |
 |item|string|null: false|
 |description_item|text|null: false|
 |item_condition|integer|null: false|
 |delivery_charge|integer  |null: false|
 |delivery_sorce|integer  |null: false|
 |days_of_ships|integer  |null: false|
 |price|numeric| null: false, presence:true,numericality:only_integer: true,greater_than: 299,less_than: 1000000
 |salse_comission|numeric|null: false, price * 10%|
 |salse_profit|numeric|null: false, price - salse_comission |

### Association
- belongs_to:user
- has_one:orderaddress
- has_one:ordercredit

## orderaddresstable

|Column|Type|Options|
|:---|:---|:---|
|address_id|bignit|null: false|
|postal_code|string|null: false, \A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/|
|prefecture| integer|null: false|
|city|string|string|null: false|
|house_number|null: false|
|building_number|string|null: false|
|phone_number|integer|null: false, /^\d{10}$|^\d{11}$/|

### Association
- belongs_to:item

## ordercredittable

|Column|Type|Options|
|:---|:---|:---|
|number|integer|null:false, /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/|
|exp_month|integer|null: false, /\A[0-9]+\z/|
|exp_year|integer|null: false, /\A[0-9]+\z/|
|cvc|integer|null: false|

### Association
- belongs_to:item


 
# Note
 
-iosやandroidnのアプリには対応していない
 
# Author

* 作成者 28124
* 所属   テックキャンプ 夜間online81期生