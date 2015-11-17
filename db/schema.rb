ActiveRecord::Schema.define(version: 20151110201250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude",            null: false
    t.float    "longitude",           null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "city_review_average"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "description"
    t.integer  "city_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "value"
    t.float    "beauty"
    t.float    "activities"
    t.float    "friendliness"
    t.float    "food"
    t.float    "touristy"
    t.integer  "user_id"
    t.float    "review_average"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "food"
    t.integer  "outdoors"
    t.integer  "city_person"
    t.integer  "off_beaten_track"
    t.integer  "touristy"
    t.integer  "shopping"
    t.integer  "danger"
    t.integer  "party"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
