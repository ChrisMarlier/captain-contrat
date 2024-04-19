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

ActiveRecord::Schema[7.0].define(version: 2024_04_19_155119) do
  create_table "fight_events", force: :cascade do |t|
    t.integer "fight_id", null: false
    t.string "attacker_name"
    t.string "defender_name"
    t.integer "damage"
    t.integer "defender_health"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_id"], name: "index_fight_events_on_fight_id"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "warrior1_id", null: false
    t.integer "warrior2_id", null: false
    t.integer "winner_id"
    t.integer "warrior1_item_id"
    t.integer "warrior2_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warrior1_id"], name: "index_fights_on_warrior1_id"
    t.index ["warrior1_item_id"], name: "index_fights_on_warrior1_item_id"
    t.index ["warrior2_id"], name: "index_fights_on_warrior2_id"
    t.index ["warrior2_item_id"], name: "index_fights_on_warrior2_item_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warriors", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 1
    t.integer "experience", default: 0
    t.integer "attack", default: 0
    t.integer "defense", default: 0
    t.integer "health", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fight_events", "fights"
  add_foreign_key "fights", "items", column: "warrior1_item_id"
  add_foreign_key "fights", "items", column: "warrior2_item_id"
  add_foreign_key "fights", "warriors", column: "warrior1_id"
  add_foreign_key "fights", "warriors", column: "warrior2_id"
  add_foreign_key "fights", "warriors", column: "winner_id"
end
