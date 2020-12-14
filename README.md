#テーブル設計

## users テーブル

|culumn    |type   |option     |
|----------|-------|-----------|
|nickname  |string |not null   |
|name      |string |not null   |
|birthday  |string |not null   |
|id        |                   |
|created_at|                   |
|updated_at|                   |

### Association

- has_many :products
- has_many :buyers
- has_one  :buy



## productsテーブル

|culumn             | type  | option    |
|-------------------|-------|-----------|
|image              |       | not null  |
|title              |string | not null  |
|explanation        |text   | not null  |
|details            |       | not null  |
|value              |       | not null  |
|delivery           |       | not null  |
|id                 |       |           |
|created_at         |       |           |
|update_at          |       |           |
|user_id         

### Association

- belongs_to :user
- has_one :buyer
- has_one :buy






## buyersテーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|postal_code |       | not null  |
|prefectures |       | not null  |
|cities      | text  | not null  |
|address     | text  | not null  |
|building    | text  |           |
|phone_number| string| not null  |
|card_number | string| not null  |
|expiration_date string| not null  |
|security_code string| not null  |
|id          |       |           |
|created_at  |       |           |
|update_at   |       |           |
|product_id  |       |           | 

### Association

- belongs_to :user
- belongs_to :product
- has_one    :buy




## buy テーブル

|culumn      | type  | option    |
|------------|-------|-----------|
|product_id  |       |           |
|user_id     |       |           |
|buyer_id    |       |           |

### Association

belongs_to :user
belongs_to :product
belongs_to :buyer