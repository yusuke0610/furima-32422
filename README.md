#テーブル設計

## users テーブル

|culumn                |type   |option                 |
|----------------------|---------|---------------------|
|nickname              |string |null:false             |
|encrypted_password    |string  |null:false            |
|email                 |string |unique: true           |
|first_name            |string |null:false             |
|last_name             |string |null:false             |
|first_name_kana       |string |null:false             |
|last_name_kana        |string | null:false            |
|birthday              |date  |null:false              |



### Association

- has_many :products
- has_many  :buys



## productsテーブル

|culumn             | type  | option    |
|-------------------|-------|-----------|
|title              |string | null:false|
|category_id        |string | null:false|
|condition_id       |string | null:false|
|delivery_fee       |integer| null:false|
|shipping_area_id   |string | null:false|
|days_ship          |integer| null:false|
|value              |integer| null:false|
|user            |reference| foreign_key: true|

### Association

- belongs_to :user
- has_one :buy






## buyersテーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|postal_code | string| null:false|
|shipping_area_id|string| null:false|
|city        | text  | null:false|
|address     | string| null:false|
|building    | string|           |
|phone_number| string| null:false|
|product  | reference |foreign_key: true|

### Association

- belongs_to   :buy




## buy テーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|product | reference | foreign_key: true|
|user     | reference | foreign_key: true|


### Association

- belongs_to :user
- belongs_to :product
- has_one: buyers
