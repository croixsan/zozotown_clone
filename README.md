# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## items table
| Column          | Type        | Options                           |
|:----------------|------------:|:---------------------------------:|
| name            | string      | null: false, index: true          |
| price           | integer     | null: false                       |
| gender          | string      | null: false                       |
| description     | text        |                                   |
| top_category_id | integer     | null: false, foreign_key: true    |
| sub_category_id | integer     | null: false, foreign_key: true    |
| coupon_id       | integer     | null: false, foreign_key: true    |
| brand_id        | integer     | null: false, foreign_key: true    |
| shop_id         | integer     | null: false, foreign_key: true    |

### Association
- belongs_to :shop
- belongs_to :brand
- belongs_to :top_category
- belongs_to :sub_category
- belongs_to :coupon

- has_many :stocks
- has_many :images
- has_many :shoppings, dependent: destroy
- has_many :carts, through :shoppings
- has_many :ordered_items
- has_many :orders, through :ordered_items
- has_many :checked_items
- has_many :favorite_items

## stocks table
| Column          | Type        | Options                           |
|:----------------|------------:|:---------------------------------:|
| item_num        | string      | null: false,                      |
| item_id         | integer     | null: false, foreign_key: true    |
| stock           | integer     | null: false                       |
| size            | integer     | null: false                       |
| color           | string      | null: false                       |

### Association
- belongs_to :item

## images table
| Column          | Type        | Options                           |
|:----------------|------------:|:---------------------------------:|
| item_id         | integer     | null: false, foreign_key: true    |
| url             | string      | null: false                       |
| color           | string      | null: false                       |

### Association
- belongs_to :item

## coupons table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| price      | integer     | null: false, unique: true              |

### Association
- has_many :items

## top_categories table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| name       | string      | null: false, index: true, unique: true |

### Association
- has_many :items
- has_many :sub_categories

## sub_categories table
| Column          | Type        | Options                                |
|:----------------|------------:|:--------------------------------------:|
| name            | string      | null: false, index: true, unique: true |
| top_category_id | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :top_category
- has_many :items

## brands table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| name       | string      | null: false, index: true, unique: true |
| url        | string      |                                        |
| gender     | string      | null: false                            |

### Association
- has_many :items
- has_many :favorite_brands

## shops table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| name       | string      | null: false, index: true, unique: true |
| concept    | text        |                                        |
| url        | string      |                                        |
| gender     | string      | null: false                            |
| logo       | string      |                                        |    

### Association
- has_many :items
- has_many :checked_shops
- has_many :favorite_shops

## carts table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false, foreign_key: true         |
| total_price | integer     |                                        |


### Association
- belongs_to :user
- has_many :shoppings
- has many :items, through: shoppings
- belongs_to :order

## shoppings table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| item_id     | integer     | null: false, foreign_key: true         |
| cart_id     | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :item
- belongs_to :cart

## users table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| name        | string      | null: false                            |
| point       | integer     | null: false                            |
| gender      | string      | null: false                       |
| birth_year  | integer     | null: false                       |
| birth_month | integer     | null: false                       |
| birth_day   | integer     | null: false                       |

### Association
- has_one :cart, dependent: destroy
- has_many :checked_items
- has_many :checked_shops
- has_many :favorite_items
- has_many :favorite_brands
- has_many :favorite_shops
- has_many :deliverys

## orders table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false, foreign_key: true         |
| cart_id     | integer     | null: false, foreign_key: true         |
| delivery_id | integer     | null: false, foreign_key: true         |
| buy_date    | datetime    | null: false                            |
| delivery_date| string     | null: false                            |
| payment     | string      | null: false                            |
| payment_num | integer     | null: false                            |
| card_id     | integer     | foreign_key: true                      |
### Association
- belongs_to :user
- has_many :ordered_items
- has_many :items, through: ordered_items
- has_one :delivery
- has_one :card
- has_one :cart

## ordered_items table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| item_id     | integer     | null: false, foreign_key: true         |
| order_id    | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :item
- belongs_to :order

## checked_items table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false, foreign_key: true         |
| item_id     | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :user
- belongs_to :item

## checked_shops table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false, foreign_key: true         |
| shop_id     | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :user
- belongs_to :shop

## favorite_items table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false, foreign_key: true         |
| item_id     | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :user
- belongs_to :item

## favorite_shops table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false, foreign_key: true         |
| shop_id     | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :user
- belongs_to :shop

## favorite_brands table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false, foreign_key: true         |
| brand_id    | integer     | null: false, foreign_key: true         |

### Association
- belongs_to :user
- belongs_to :brand

## delivery
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | string      | null: false, foreign_key: true         |
| kind        | integer     | null: false                            |
| post_num    | integer     | null: false                            |
| phone_num   | integer     | null: false                            |

### Association
- belongs_to :user
- belongs_to :order

## card
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | integer     | null: false                            |
| name        | string      | null: false                            |
| number      | string      | null: false,foreign_key: true          |
| limit_year  | integer     | null: false                            |
| limit_month | integer     | null: false                            |
| security_code| integer    | null: false                            |

### Association
- belongs_to :order
- belongs_to :user

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

