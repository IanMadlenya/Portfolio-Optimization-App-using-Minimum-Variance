# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091102225106) do

  create_table "annual_returns", :force => true do |t|
    t.integer  "historical_asset_id",                               :null => false
    t.decimal  "return_value",        :precision => 6, :scale => 4, :null => false
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "annual_returns", ["return_value"], :name => "index_annual_returns_on_return_value"

  create_table "historical_assets", :force => true do |t|
    t.string   "symbol",     :null => false
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historical_assets", ["symbol"], :name => "index_historical_assets_on_symbol"

  create_table "minimal_risk_portfolios", :force => true do |t|
    t.decimal  "return_level",                   :precision => 6, :scale => 4, :null => false
    t.boolean  "minimum_variance_is_attainable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolio_assets", :force => true do |t|
    t.integer "minimal_risk_portfolio_id",                               :null => false
    t.string  "symbol",                                                  :null => false
    t.string  "name"
    t.decimal "mean_return",               :precision => 6, :scale => 4
    t.decimal "variance_return",           :precision => 6, :scale => 4
    t.decimal "weight_in_portfolio",       :precision => 6, :scale => 4
  end

  add_index "portfolio_assets", ["symbol"], :name => "index_portfolio_assets_on_symbol"

end
