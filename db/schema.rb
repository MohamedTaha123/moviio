# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_018_133_925) do
  create_table 'episodes', force: :cascade do |t|
    t.string 'title'
    t.string 'plot'
    t.integer 'season_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'number'
    t.index ['season_id'], name: 'index_episodes_on_season_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title'
    t.string 'plot'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'purchases', force: :cascade do |t|
    t.integer 'video_quality'
    t.decimal 'price', precision: 8, scale: 2
    t.string 'purchasable_type', null: false
    t.integer 'purchasable_id', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'purchased_at'
    t.datetime 'expire_at'
    t.index %w[purchasable_type purchasable_id], name: 'index_purchases_on_purchasable_type_and_purchasable_id'
    t.index ['user_id'], name: 'index_purchases_on_user_id'
  end

  create_table 'seasons', force: :cascade do |t|
    t.string 'title'
    t.string 'plot'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'number'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'episodes', 'seasons'
  add_foreign_key 'purchases', 'users'
end
