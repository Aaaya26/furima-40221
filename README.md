## users テーブル

| Column               | Type   | Options                  |
|----------------------|--------|--------------------------|
| nickname             | string | null: false              |
| mail                 | string | null: false,unique: true |
| encrypted_password   | string | null: false              |
| family_name          | string | null: false              |
| first_name           | string | null: false              |
| family_name_kana     | string | null: false              |
| first_name_kana      | string | null: false              |
| birthday             | string | null: false              |

## Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                         |
|---------------|------------|---------------------------------|
| item_name     | string     | null: false                     |
| item_data     | text       | null: false                     |
| item_category | integer    | null: false                     |
| item_status   | integer    | null: false                     |
| charge        | integer    | null: false                     |
| ship_from     | integer    | null: false                     |
| ship_date     | integer    | null: false                     |
| price         | integer    | null: false                     |
| user          | references | null: false, foreign_key: true  |

## Association

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_many   :items
- has_one    :address


## address テーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| post_code       | integer    | null: false                    |
| prefectures     | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| street          | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| order           | references | null: false, foreign_key: true |

## Association

- belongs to :order
