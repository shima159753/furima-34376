# テーブル設計

## users テーブル

| Column              | Type    | Options     |               
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| last_name_kanji     | string  | null: false |
| first_name_kanji    | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birth_day           | integer | null: false |

### Association

- has_many :items

## items テーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| items_name        | text      | null: false                    |
| text              | text      | null: false                    |
| items_category_id | integer   | null: false                    |
| items_state_id    | integer   | null: false                    |
| delivery_fee      | integer   | null: false                    |
| delivery_area     | integer   | null: false                    |
| delivery_days     | integer   | null: false                    |
| price             | integer   | null: false                    |
| user              | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## buyers テーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| postal_code       | string    | null: false                    |
| prefecture        | integer   | null: false                    |
| city              | string    | null: false                    |
| address           | string    | null: false                    |
| building_name     | string    | null: true                     |
| tel               | integer   | null: false                    |
| item              | reference | null: false, foreign_key: true |

### Association

- belongs_to :item