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
| birth_year     | integer | null: false                   |
| birth_month    | integer | null: false                   |
| birth_date     | integer | null: false                   |

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
| products_image   | references | null: false, foreign_key: true |
| products_name    | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| area             | string     | null: false                    |
| days             | integer    | null: false                    | 
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- has_many :comments
- belongs_to :user

## credit_cards テーブル

| Column            | Type       | Options     |
| -------           | ---------- | ----------- |
| info              | integer    | null: false |
| month             | integer    | null: false |
| year              | integer    | null: false |
| security_code     | integer    | null: false |

### Association

- belongs_to :user

## purchases テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| postcode         | integer    | null: false                    |
| prefecture_id    | string     | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     | null: false                    |
| phone_number     | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |



### Association

- belongs_to :user
