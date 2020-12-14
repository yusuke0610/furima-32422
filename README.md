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
|Category           |string | null:false|
|condition          |string | null:false|
|delivery_fee       |integer| null:false|
|shipping_area      |string | null:false|
|days_ship          |integer| null:false|
|value              |integer| null:false|
|user_id            |reference| set null|

### Association

- belongs_to :user
- has_one :buy






## buyersテーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|postal_code | string| null:false|
|prefectures |       | null:false|
|city        | text  | null:false|
|address     | string| null:false|
|building    | string|           |
|phone_number| string| null:false|
|product_id  | reference |set null|

### Association

- belongs_to   :buy




## buy テーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|product_id  | reference | set null|
|user_id     | reference | set null|


### Association

- belongs_to :user
- belongs_to :product
- has_one: buyers
