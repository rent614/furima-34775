# テーブル設計

## users テーブル

| Column         | Type    | Options                       |
| --------       | ------  | -----------                   |
| nickname       | string  | null: false                   |
| email          | string  | null: false                   |
| password       | string  | null: false                   |
| last_name      | string  | null: false                   |
| first_name     | string  | null: false                   |
| last_name_kana | string  | null: false                   |
| first_name_kana| string  | null: false                   |
| birthday       | date    | null: false                  |


### Association

- has_many :comments
- has_many :products
- has_one  :credit_card
- has_one  :purchases


## comments テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| comment   | text   | null: false |

### Association

- belongs_to :user
- belongs_to :products

## products テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| products_name    | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  |  integer   | null:false                     |
| area_id          | integer    | null: false                    |
| days_id          | integer    | null: false                    | 
| price            | integer    | null: false                    |
| user             | string     | null: false                    |





### Association

- has_many :comments
- belongs_to :user

## purchase history テーブル

| Column            | Type       | Options     |
| -------           | ---------- | ----------- |
| user_id           | references | null: false, foreign_key: true |
| product_id        | references | null: false, foreign_key: true |
| buyer_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## purchases テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |



### Association

- belongs_to :user
