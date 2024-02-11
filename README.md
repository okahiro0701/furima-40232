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
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | string     | null: false                    |
| item_explanation       | text       | null: false                    |
| category_id            | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| delivery_time_id       | integer    | null: false                    |
| price                  | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |

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
| zip_code       | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city_name      | string     | null: false                    |
| block_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order