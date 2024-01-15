## users テーブル

| Column               | Type   | Options                  |
|----------------------|--------|--------------------------|
| nickname             | string | null: false              |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false              |
| family_name          | string | null: false              |
| first_name           | string | null: false              |
| family_name_kana     | string | null: false              |
| first_name_kana      | string | null: false              |
| birthday             | date   | null: false              |

## Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                         |
|------------------|------------|---------------------------------|
| item_name        | string     | null: false                     |
| item_data        | text       | null: false                     |
| item_category_id | integer    | null: false, foreign_key: true  |
| item_status_id   | integer    | null: false, foreign_key: true  |
| charge_id        | integer    | null: false, foreign_key: true  |
| prefecture_id    | integer    | null: false, foreign_key: true  |
| prefecture_id    | integer    | null: false, foreign_key: true  |
| price            | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

## Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :item_category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :charge
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :ship_date


## orders テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item


## address テーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| post_code       | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| street          | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

## Association

- belongs to :order
- belongs_to_active_hash :prefecture
