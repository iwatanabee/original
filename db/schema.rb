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

ActiveRecord::Schema.define(version: 2021_06_13_201704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: :cascade do |t|
    t.string "body11"
    t.string "body12"
    t.string "body13"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "body14"
    t.string "body15"
    t.string "body16"
    t.string "body17"
    t.string "body18"
    t.string "body19"
    t.string "body21"
    t.string "body22"
    t.string "body23"
    t.string "body24"
    t.string "body25"
    t.string "body26"
    t.string "body27"
    t.string "body28"
    t.string "body29"
    t.string "body31"
    t.string "body32"
    t.string "body33"
    t.string "body34"
    t.string "body35"
    t.string "body36"
    t.string "body37"
    t.string "body38"
    t.string "body39"
    t.string "body41"
    t.string "body42"
    t.string "body43"
    t.string "body44"
    t.string "body45"
    t.string "body46"
    t.string "body47"
    t.string "body48"
    t.string "body49"
    t.string "body51"
    t.string "body52"
    t.string "body53"
    t.string "body54"
    t.string "body55"
    t.string "body56"
    t.string "body57"
    t.string "body58"
    t.string "body59"
    t.string "body61"
    t.string "body62"
    t.string "body63"
    t.string "body64"
    t.string "body65"
    t.string "body66"
    t.string "body67"
    t.string "body68"
    t.string "body69"
    t.string "body71"
    t.string "body72"
    t.string "body73"
    t.string "body74"
    t.string "body75"
    t.string "body76"
    t.string "body77"
    t.string "body78"
    t.string "body79"
    t.string "body81"
    t.string "body82"
    t.string "body83"
    t.string "body84"
    t.string "body85"
    t.string "body86"
    t.string "body87"
    t.string "body88"
    t.string "body89"
    t.string "body91"
    t.string "body92"
    t.string "body93"
    t.string "body94"
    t.string "body95"
    t.string "body96"
    t.string "body97"
    t.string "body98"
    t.string "body99"
    t.integer "workspace_id"
  end

  create_table "memos", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "mail"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

end
