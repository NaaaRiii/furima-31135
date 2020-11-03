## Users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| katakana_first_name | string | null: false |
| katakana_last_name  | string | null: false |
| birthday            | date   | null: false |

### Association

## Items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| product_name        | string     | null: false |
| product_description | text       | null: false |
| category            | integer    | null: false |
| product_condition   | integer    | null: false |
| shipping_charges    | integer    | null: false |
| shipping_area       | integer    | null: false |
| price               | string     | null: false |
| sell_user           | references |             |

## has_one

## Purchase テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| who                 | references |             |
| when                |            |             |
| what                |            |             |

## Adress テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| post_number         | string     | null: false |
| prefectures         | integer    | null: false |
| city                | string     | null: false |
| product_condition   | integer    | null: false |
| street_address      | string     | null: false |
| building            | string     |             |
| phone_number        | string     | null: false |
