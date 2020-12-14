#テーブル設計

## users テーブル

|culumn                |type   |option                 |
|----------------------|---------|---------------------|
|nickname              |string |null:false             |
|password_confirmation |string  |null:false            |
|email                 |string |null:false             |
|first_name            |string |null:false             |
|last_name             |string |null:false             |
|first_name_kana       |string |null:false             |
|last_name_kana        |string | null:false            |
|birthday              |date  |null:false              |



### Association

- has_many :products
- has_many :buyers
- has_one  :buy



## productsテーブル

|culumn             | type  | option    |
|-------------------|-------|-----------|
|title              |string | null:false|
|explanation        |text   | null:false|
|details            |       | null:false|
|value              |       | null:false|
|delivery           |       | null:false|
|user_id            | string| null:false|

### Association

- belongs_to :user
- has_one :buy






## buyersテーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|postal_code | string| null:false|
|prefectures |       | null:false|
|cities      | text  | null:false|
|address     | text  | null:false|
|building    | text  |           |
|phone_number| string| null:false|
|product_id  | string| null:false| 

### Association

- has_one    :buy




## buy テーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|product_id  | string| null:false|
|user_id     | string| null:false|


### Association

- belongs_to :user
- belongs_to :product
