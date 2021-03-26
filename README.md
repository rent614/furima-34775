# テーブル設計

## users テーブル

| Column             | Type    | Options                       |
| --------           | ------  | -----------                   |
| nickname           | string  | null: false                   |
| email              | string  | null: false, unique: true     |
| encrypted_password | string  | null: false                   |
| last_name          | string  | null: false                   |
| first_name         | string  | null: false                   |
| last_name_kana     | string  | null: false                   |
| first_name_kana    | string  | null: false                   |
| birthday           | date    | null: false                   |


### Association

- has_many :comments
- has_many :products
- has_many :purchases_histories



## comments テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| comment   | text   | null: false |

### Association

- belongs_to :user
- belongs_to :product

## products テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| products_name    | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  |  integer   | null:false                     |
| area_id          | integer    | null: false                    |
| day_id           | integer    | null: false                    | 
| price            | integer    | null: false                    |
| user             | references | null: false,foreign_key: true   |





### Association

- has_many :comments
- belongs_to :user
- has_one :purchase_history
## purchase_histories テーブル

| Column            | Type       | Options     |
| -------           | ---------- | ----------- |
| user              | references | null: false, foreign_key: true |
| product           | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- belongs_to :product
- has_one    :purchase


## purchases テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |



### Association

- belongs_to :purchase_history
