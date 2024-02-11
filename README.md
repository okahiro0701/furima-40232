## usersテーブル

| Column               | Type       | Options                   |
| -------------------- | ---------- | ------------------------- |
| nickname             | string     | null: false               |
| email                | string     | null: false, unique: true |
| encrypted_password   | string     | null: false               |
| family_name          | string     | null: false               |
| first_name           | string     | null: false               |
| family_name_kana     | string     | null: false               |
| first_name_kana      | string     | null: false               |
| birth_date           | date       | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_explanation     | text       | null: false                    |
| category             | string     | null: false                    |
| item_condition       | string     | null: false                    |
| shipping_fee_burden  | string     | null: false                    |
| ship_from_address    | string     | null: false                    |
| delivery_time        | string     | null: false                    |
| price                | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| address        | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| block_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order