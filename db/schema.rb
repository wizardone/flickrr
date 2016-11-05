# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161105084017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "history", force: :cascade do |t|
    t.jsonb   "data"
    t.integer "user_id"
    t.index ["user_id"], name: "index_history_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "email",    null: false
    t.string "password", null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

end
