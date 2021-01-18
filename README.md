# README

#　テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association
- has_many : products
- has_many : buyers


## productsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | string     | null: false                    |
| description     | string     | null: false                    |
| status          | string     | null: false                    |
| shipping_cost   | string     | null: false                    |
| shipping_source | string     | null: false                    |
| shipping_day    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_many : buyers


## buyersテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     |                                |
| user_id          | references | null: false, foreign_key: true |
| product_id       | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : product
