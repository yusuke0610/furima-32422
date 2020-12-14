#テーブル設計

## users テーブル

|culumn    |type   |option     |
|----------|-------|-----------|
|nickname  |string |not null   |
|password  |string |not null   |
|password_confirmation  |string |not null   |
|email     |string | not null  |
|苗字　　　　|string |not null   |
|名前       |string |not null   |
|セイ　　　  |string | not null  |
|メイ       |string | not null  |
|birthday   |date  |not null   |
|created_at|                   |
|updated_at|                   |

### Association

- has_many :products
- has_many :buyers
- has_one  :buy



## productsテーブル

|culumn             | type  | option    |
|-------------------|-------|-----------|
|title              |string | not null  |
|explanation        |text   | not null  |
|details            |       | not null  |
|value              |       | not null  |
|delivery           |       | not null  |
|id                 |       |           |
|created_at         |       |           |
|update_at          |       |           |
|user_id            |       |           |

### Association

- belongs_to :user
- has_one :buy






## buyersテーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|postal_code | string| not null  |
|prefectures |       | not null  |
|cities      | text  | not null  |
|address     | text  | not null  |
|building    | text  |           |
|phone_number| string| not null  |
|id          |       |           |
|created_at  |       |           |
|update_at   |       |           |
|product_id  |       |           | 

### Association

- has_one    :buy




## buy テーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|product_id  | string|  not null |
|user_id     | string|  not null |


### Association

- belongs_to :user
- belongs_to :product
