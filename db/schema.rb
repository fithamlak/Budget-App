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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_030643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_expenses", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "expense_id"], name: "index_category_expenses_on_category_id_and_expense_id", unique: true
    t.index ["category_id"], name: "index_category_expenses_on_category_id"
    t.index ["expense_id"], name: "index_category_expenses_on_expense_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_expenses_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "category_expenses", "categories"
  add_foreign_key "category_expenses", "expenses"
  add_foreign_key "expenses", "users", column: "author_id"
end