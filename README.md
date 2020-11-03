## Users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| katakana_first_name | string | null: false               |
| katakana_last_name  | string | null: false               |
| birthday            | date   | null: false               |

### Association
has_many :purchase
has_many :items

## Items テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| product_name         | string     | null: false       |
| product_description  | text       | null: false       |
| category_id          | integer    | null: false       |
| product_condition_id | integer    | null: false       |
| shipping_charges_id  | integer    | null: false       |
| shipping_area_id     | integer    | null: false       |
| days_ship_id         | integer    | null: false       |
| price                | string     | null: false       |
| user                 | references | foreign_key: true |

## Association
has_one :purchase
belongs_to :users

## Purchase テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | references | foreign_key: true |
| item                | references | foreign_key: true |

## Association
belongs_to :users
belongs_to :address
belongs_to :items

## Address テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| post_number          | string     | null: false |
| prefectures_id       | integer    | null: false |
| city                 | string     | null: false |
| product_condition_id | integer    | null: false |
| street_address       | string     | null: false |
| building             | string     |             |
| phone_number         | string     | null: false |

## Association
belongs_to :purchase