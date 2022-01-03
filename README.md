# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| password           | string | null: false              |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_in_kana  | string | null: false              |
| first_name_in_kana | string | null: false              |
| date_of_birth      | integer| null: false              |

### Association

- has_many :items
- has_many :perchase_records

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| consignor          | string     | null: false                    |
| days_to_delivery   | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record


## purchase_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| zip_code           | integer | null: false              |
| prefecture         | string  | null: false              |
| city               | string  | null: false              |
| address            | string  | null: false              |
| building           | string  |                          |
| telephone_number   | integer | null: false              |

### Association

- belongs_to :purchase_record