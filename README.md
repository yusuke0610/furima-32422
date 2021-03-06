#テーブル設計

## users テーブル

|culumn                |type     |option                 |
|----------------------|---------|-----------------------|
|nickname              |string   |null:false             |
|encrypted_password    |string   |null:false             |
|email                 |string   |unique: true           |
|first_name            |string   |null:false             |
|last_name             |string   |null:false             |
|first_name_kana       |string   |null:false             |
|last_name_kana        |string   |null:false            |
|birthday              |date     |null:false            |



### Association

- has_many :items
- has_many :orders




## itemsテーブル

|culumn             | type  | option           |
|-------------------|-------|------------------|
|title              |string |null:false        |
|explanation        | text  |null:false        |
|category_id        |integer|null:false        |
|condition_id       |integer|null:false        |
|delivery_fee_id    |integer|null:false        |
|shipping_area_id   |integer|null:false        |
|days_ship_id       |integer|null:false        |
|value              |integer|null:false        |
|user            |references|foreign_key: true |

### Association

- belongs_to :user
- has_one    :order






## addressテーブル

|culumn          | type  | option    |
|----------------|-------|-----------|
|postal_code     |string |null:false |
|shipping_area_id|integer|null:false |
|city            |string |null:false |
|address         |string |null:false |
|building        |string |           |
|phone_number    |string |null:false |
|buy   |references |foreign_key: true|

### Association

- belongs_to :order





## order テーブル

|culumn   | type  | option                |
|---------|-------|-----------------------|
|item     |references|foreign_key: true   |
|user     |references|foreign_key: true   |
|price    |integer| null:false            |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


