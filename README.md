## usersテーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| nickname             | string     | null: false |
| email                | string     | null: false |
| password             | string     | null: false |
| password_confirmation| string     | null: false |
| name                 | string     | null: false |
| name_kana            | string     | null: false |
| birth_date           | string     | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| category             | string     | null: false                    |
| price                | string     | null: false                    |
| seller               | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :orders

## ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buyer  | string     |                                |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :address

## addressテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| address  | string     | null: false                    |
| order    | references | null: false, foreign_key: true |

### Association
- belongs_to :orders