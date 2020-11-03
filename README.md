## Users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false, unique: true |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| katakana_first_name | string | null: false               |
| katakana_last_name  | string | null: false               |
| birthday            | date   | null: false               |

### Association
has_many :purchases
has_many :items

## Items テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| product_name         | string     | null: false       |
| product_description  | text       | null: false       |
| category_id          | integer    | null: false       |
| product_condition_id | integer    | null: false       |
| shipping_charge_id   | integer    | null: false       |
| shipping_area_id     | integer    | null: false       |
| days_ship_id         | integer    | null: false       |
| price                | integer    | null: false       |
| user                 | references | foreign_key: true |

## Association
has_one :purchase
belongs_to :user

## Purchase テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | references | foreign_key: true |
| item                | references | foreign_key: true |

## Association
belongs_to :user
has_one    :address
belongs_to :item

## Address テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| post_number          | string     | null: false       |
| prefecture_id        | integer    | null: false       |
| city                 | string     | null: false       |
| street_address       | string     | null: false       |
| building             | string     |                   |
| phone_number         | string     | null: false       |
| purchase             | references | foreign_key: true |

## Association
belongs_to :purchase