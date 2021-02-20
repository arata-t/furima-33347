# users
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null :false |
| email               | string | null :false |
| encrypted_password | string | null :false |
| last_name          | string | null :false |
| first_name         | string | nill :false |
| last_name_kana     | string | null :false |
| first_name_kana    | string | null :false |

## Association
has_many :items
has_one  :deliveries
has_one  :purchases
has_many :comments


# items
| Column         | Type           | Options                        |
| -------------- | -------------- | ------------------------------ |
| product_name   | string         | null :false                    |
| category       | string         | null :false                    |
| price          | integer        | null :false                    |
| seller         | string         | null :false                    |
| image          | active_storage | null :false                    |
| product_status | string         | null :false                    |
| burden         | string         | null :false                    |
| area           | string         | null :false                    |
| days           | integer        | null :false                    |
| description    | text           | null :false                    |
| user_id        | reference      | null :false, foreign_key: true |
|                |                |                                |

### Associations
belongs_to :user
has_many   :comments


# deliveries
| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| postal_code   | integer   | null :false                    |
| preference    | string    | null :false                    |
| city          | string    | null :false                    |
| house_num     | string    | null :false                    |
| building_name | string    | null :false                    |
| phone         | integer   | null :false                    |
| user_id       | reference | null :false, foreign_key: true |
|               |           |                                |

### Association
belongs_to :user


# Purchases
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| card_num      | integer | null :false                    |
| expiration    | integer | null :false                    |
| security_code | integer | null :false                    |
| user_id       | integer | null :false, foreign_key: true |
|               |         |                                |

### Association
belongs_to :user


# Comment
| Columns | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| comment | text      | null :false                    |
| user_id | reference | null :false, foreign_key: true |
| item_id | reference | null :false, foreign_key: true |
|         |           |                                |

### Association
belongs_to :user
belongs_to :item