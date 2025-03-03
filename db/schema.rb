# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_03_191533) do
  create_table "amounts", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.integer "mengen"
    t.string "einheit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_amounts_on_ingredient_id"
    t.index ["recipe_id"], name: "index_amounts_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "weeklyplaners", force: :cascade do |t|
    t.string "title"
    t.integer "monday_recipe_id"
    t.integer "tuesday_recipe_id"
    t.integer "wednesday_recipe_id"
    t.integer "thursday_recipe_id"
    t.integer "friday_recipe_id"
    t.integer "satureday_recipe_id"
    t.integer "sunday_recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friday_recipe_id"], name: "index_weeklyplaners_on_friday_recipe_id"
    t.index ["monday_recipe_id"], name: "index_weeklyplaners_on_monday_recipe_id"
    t.index ["satureday_recipe_id"], name: "index_weeklyplaners_on_satureday_recipe_id"
    t.index ["sunday_recipe_id"], name: "index_weeklyplaners_on_sunday_recipe_id"
    t.index ["thursday_recipe_id"], name: "index_weeklyplaners_on_thursday_recipe_id"
    t.index ["tuesday_recipe_id"], name: "index_weeklyplaners_on_tuesday_recipe_id"
    t.index ["wednesday_recipe_id"], name: "index_weeklyplaners_on_wednesday_recipe_id"
  end

  add_foreign_key "sessions", "users"
  add_foreign_key "weeklyplaners", "recipes", column: "friday_recipe_id"
  add_foreign_key "weeklyplaners", "recipes", column: "monday_recipe_id"
  add_foreign_key "weeklyplaners", "recipes", column: "satureday_recipe_id"
  add_foreign_key "weeklyplaners", "recipes", column: "sunday_recipe_id"
  add_foreign_key "weeklyplaners", "recipes", column: "thursday_recipe_id"
  add_foreign_key "weeklyplaners", "recipes", column: "tuesday_recipe_id"
  add_foreign_key "weeklyplaners", "recipes", column: "wednesday_recipe_id"
end
