# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

<<<<<<< Updated upstream
* ...
=======





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

- belongs_to :user
- belongs_to :product
- belongs_to :buyer
>>>>>>> Stashed changes
