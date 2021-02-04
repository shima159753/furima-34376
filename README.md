# テーブル設計

## users テーブル

| Column              | Type    | Options                   |               
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name_kanji     | string  | null: false               |
| first_name_kanji    | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |
| birth_day           | date    | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| text              | text       | null: false                    |
| category_id       | integer    | null: false                    |
| state_id          | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| delivery_area_id  | integer    | null: false                    |
| delivery_days_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buyers

## buyers テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| delivery_area_id  | integer    | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     | null: true                     |
| tel               | string     | null: false                    |
| item              | references | null: false, foreign_key: true |
| order             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order