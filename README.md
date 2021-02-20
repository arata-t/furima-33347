# users
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nick_name          | string  | null :false |
| email              | string  | null :false |
| encrypted_password | string  | null :false |
| last_name          | string  | null :false |
| first_name         | string  | nill :false |
| last_name_kana     | string  | null :false |
| first_name_kana    | string  | null :false |
| birth_day          | integer | null :false |
|                    |         |             |


## Association
has_many :items
has_one  :deliveries
has_one  :purchases
has_many :comments


# items
| Column            | Type           | Options                        |
| ----------------- | -------------- | ------------------------------ |
| product_name      | string         | null :false                    |
| category_id       | integer        | null :false                    |
| price             | integer        | null :false                    |
| seller            | string         | null :false                    |
| image             | active_storage | null :false                    |
| product_status_id | integer        | null :false                    |
| burden_id         | integer        | null :false                    |
| area_id           | integer        | null :false                    |
| days_id           | integer        | null :false                    |
| description       | text           | null :false                    |
| user              | references     | null :false, foreign_key: true |
|                   |                |                                |

### Associations
belongs_to :user
has_many   :comments


# deliveries
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null :false                    |
| preference    | string     | null :false                    |
| city          | string     | null :false                    |
| house_num     | string     | null :false                    |
| building_name | string     | null :false                    |
| phone         | integer    | null :false                    |
| user          | references | null :false, foreign_key: true |
|               |            |                                |

### Association
belongs_to :user


# Purchases
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null :false, foreign_key: true |
| item   | references | null :false, foreign_key: true |
|        |            |                                |

### Association
belongs_to :user


# Comment
| Columns | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null :false                    |
| user    | references | null :false, foreign_key: true |
| item    | references | null :false, foreign_key: true |
|         |            |                                |

### Association
belongs_to :user
belongs_to :item