# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121107145014) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collections", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "collections", ["user_id"], :name => "index_collections_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "link"
    t.text     "content"
    t.integer  "status"
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "comparisons", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comparisons", ["user_id"], :name => "index_comparisons_on_user_id"

  create_table "emails", :force => true do |t|
    t.integer  "user_id"
    t.string   "recipient"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emails", ["user_id"], :name => "index_emails_on_user_id"

  create_table "identities", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "admin"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "veri"
  end

  add_index "manufacturers", ["email"], :name => "index_manufacturers_on_email", :unique => true
  add_index "manufacturers", ["remember_token"], :name => "index_manufacturers_on_remember_token"

  create_table "myitems", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "price"
    t.text     "purchase_proof"
    t.string   "current_value"
    t.string   "purchase_date"
    t.text     "location_of_manual"
    t.string   "resale_value"
    t.string   "rental_value"
    t.text     "repair_locations"
    t.text     "extra_notes"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "item_recall"
    t.string   "collection"
  end

  add_index "myitems", ["user_id"], :name => "index_myitems_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "manufacturer_link"
    t.string   "dimensions"
    t.string   "weight"
    t.string   "price"
    t.text     "keywords"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "category"
    t.integer  "manufacturer_id"
    t.integer  "retailer_id"
  end

  create_table "retailers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "veri"
  end

  add_index "retailers", ["email"], :name => "index_retailers_on_email", :unique => true
  add_index "retailers", ["remember_token"], :name => "index_retailers_on_remember_token"

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "supercomments", :force => true do |t|
    t.integer  "manufacturer_id"
    t.integer  "retailer_id"
    t.text     "content"
    t.string   "link"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "status"
  end

  create_table "users", :force => true do |t|
    t.string   "screenname"
    t.string   "name"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "verifications", :force => true do |t|
    t.integer  "manufacturer_id"
    t.integer  "retailer_id"
    t.integer  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "wishitems", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wishitems", ["user_id"], :name => "index_wishitems_on_user_id"

end
