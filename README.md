# テーブル設計

## usersテーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| first_name         | string     | null: false                |
| last_name          | string     | null: false                |
| nickname           | string     | null: false                |
| kana_f_name        | string     | null: false                |
| email              | string     | null: false, unique:true   |
| kana_l_name        | string     | null: false                |
| birthday           | date       | null: false                |
| encrypted_password | string     | null: false                |


### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Column                        | Type       | Options                      |
| ----------------------------- | ---------  | ---------------------------- |
| name                          | string     | null: false                  |
| item_description              | text       | null: false                  |
| user                          | references | foreign_key: true            |
| price                         | integer    | null: false                  |
| category_id                   | integer    | null: false                  |
| state_id                      | integer    | null: false                  |
| delivery_fee_burden_id        | integer    | null: false                  |
| shipment_source_prefecture_id | integer    | null: false                  |
| days_to_ship_id               | integer    | null: false                 | 


### Association

- belongs_to :user
- has_one :buy

## street_addressテーブル

| Column        | Type       | Option                           |
| ------------- | ---------- | -------------------------------- |
| prefecture_id | integer    | null: false                      |
| postal_core   | string     | null: false                      |
| municipality  | string     | null: false                      |
| address       | string     | null: false                      |
| building_name | string     |                                  |
| phone_number  | string     | null: false                      |
| buy           | references | foreign_key: true                |

### Association
- belongs_to :buy
 
## buysテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | foreign_key: true             |
| item    | references | foreign_key: true             |


# Association

- belongs_to :item
- belongs_to :user
- has_one :street_address

