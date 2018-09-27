# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## items table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| item_num   | integer     | null: false, unique: true              |
|:-----------|------------:|:--------------------------------------:|
| name       | string      | null: false, index: true               |
|:-----------|------------:|:--------------------------------------:|
| price      | integer     | null: false                            |
|:-----------|------------:|:--------------------------------------:|
| stock      | integer     | null: false                            |
|:-----------|------------:|:--------------------------------------:|
| gender_id  | foreign_key | null: false                            |
|:-----------|------------:|:--------------------------------------:|
| size_id    | foreign_key | null: false,                           |
|:-----------|------------:|:--------------------------------------:|
| category_id| foreign_key | null: false                            |
|:-----------|------------:|:--------------------------------------:|
| coupon_id  | foreign_key | null: false,                           |
|:-----------|------------:|:--------------------------------------:|
| brand_id   | foreign_key | null: false                            |
|:-----------|------------:|:--------------------------------------:|
| shop_id    | foreign_key | null: false,                           |

### Association
- belongs_to :size
- belongs_to :category
- belongs_to :coupon

- has_many :items_carts, dependent: destroy
- has_many :carts, through :items_carts
- has_many :items_orders
- has_many :orders, through :items_orders
- has_many :checked_items
- has_many :like_items

## genders table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| type       | string      | null: false, unique: true              |

### Association
- has_many :items

## sizes table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| type       | string      | null: false, unique: true              |

### Association
- has_many :items

## coupons table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| price      | integer     | null: false, unique: true              |

### Association
- has_many :items

## categories table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| name       | string      | null: false, index: true, unique: true              |

### Association
- has_many :items

## brands table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| name       | string      | null: false, index: true, unique: true              |
|:-----------|------------:|:--------------------------------------:|
| url        | string      |                                        |

### Association
- has_many :brands_carts
- has many :carts, through: brands_carts
- has_many :brands_orders
- has_many :orders, through: brands_orders
- has_many :like_brands

## shops table
| Column     | Type        | Options                                |
|:-----------|------------:|:--------------------------------------:|
| name       | string      | null: false, index: true, unique: true              |
|:-----------|------------:|:--------------------------------------:|
| concept    | text        |                                        |
|:-----------|------------:|:--------------------------------------:|
| logo       | string      |    

### Association
- has_many :shops_carts
- has many :carts, through: shops_carts
- has_many :shops_orders
- has_many :orders, through: shops_orders
- has_many :like_shops

## carts table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false, index: true, unique: true              |
|:------------|------------:|:--------------------------------------:|
| total_price | integer     |                                        |


### Association
- belongs_to :user
- has_many :items_carts
- has many :carts, through: items_carts
- has_many :brands_carts
- has_many :brands, through: brands_carts
- has_many :shops_carts
- has_many :shops, through: shops_carts

## items_carts table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| item_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| cart_id     | foreign_key | null: false                            |

### Association
- belongs_to :item
- belongs_to :cart

## brands_carts table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| brand_id     | foreign_key| null: false                            |
|:------------|------------:|:--------------------------------------:|
| cart_id     | foreign_key | null: false                            |

### Association
- belongs_to :brand
- belongs_to :cart

## shops_carts table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| shop_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| cart_id     | foreign_key | null: false                            |

### Association
- belongs_to :shop
- belongs_to :cart

## users table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| member_num  | integer     | null: false, index: true, unique: true          |
|:------------|------------:|:--------------------------------------:|
| name        | string      | null: false                            |
|:------------|------------:|:--------------------------------------:|
| post_num    | integer     | null: false                            |
|:------------|------------:|:--------------------------------------:|
| address     | string      | null: false                            |
|:------------|------------:|:--------------------------------------:|
| phone_num   | integer     | null: false                            |
|:------------|------------:|:--------------------------------------:|
| point       | integer     | null: false                            |
|:------------|------------:|:--------------------------------------:|
| gender_id   | foreign_key | null: false                            |

### Association
- belongs_to :birthday
- belongs_to :gender
- belongs_to :cart
- has_many :checked_items
- has_many :like_items
- has_many :like_brands
- has_many :like_shops

## birthdays table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false, unique: true              |
|:------------|------------:|:--------------------------------------:|
| year        | integer     | null: false                            |
|:------------|------------:|:--------------------------------------:|
| month       | integer     | null: false                            |
|:------------|------------:|:--------------------------------------:|
| day         | integer     | null: false                            |

### Association
- has_many :users

## orders table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| order_num   | integer     | null: false, unique: true              |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| cart_id     | foreign_key | null: false                            |

### Association
- has_many :items_orders
- has_many :items, through: items
- has_many :brands_orders
- has_many :brands, through: brands_orders
- has_many :shops_orders
- has_many :shops, through: shops_orders
- has_many :users_orders
- has_many :users, through: users_orders

## items_orders table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| item_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| order_id    | foreign_key | null: false                            |

### Association
- belongs_to :item
- belongs_to :order

## brands_orders table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| brand_id    | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| order_id    | foreign_key | null: false                            |

### Association
- belongs_to :brand
- belongs_to :order

## shops_orders table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| shop_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| order_id    | foreign_key | null: false                            |

### Association
- belongs_to :shop
- belongs_to :order

## checked_items table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| item_id     | foreign_key | null: false                            |

### Association
- belongs_to :user
- belongs_to :item

## checked_shops table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| shop_id     | foreign_key | null: false                            |

### Association
- belongs_to :user
- belongs_to :shop

## brand_likes table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| brand_id    | foreign_key | null: false                            |

### Association
- belongs_to :user
- belongs_to :brand

## shop_likes table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| shop_id     | foreign_key | null: false                            |

### Association
- belongs_to :user
- belongs_to :shop

## item_likes table
| Column      | Type        | Options                                |
|:------------|------------:|:--------------------------------------:|
| user_id     | foreign_key | null: false                            |
|:------------|------------:|:--------------------------------------:|
| item_id     | foreign_key | null: false                            |

### Association
- belongs_to :user
- belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
