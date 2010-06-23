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

ActiveRecord::Schema.define(:version => 20100623153337) do

  create_table "matches", :force => true do |t|
    t.integer  "team_1_id",                                          :null => false
    t.integer  "team_2_id",                                          :null => false
    t.datetime "starts_at",                                          :null => false
    t.integer  "goals_first_half_team_1"
    t.integer  "goals_team_1"
    t.integer  "goals_first_half_team_2"
    t.integer  "goals_team_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "round",                   :default => "Vorrunde",    :null => false
    t.string   "type",                    :default => "Preliminary", :null => false
    t.boolean  "finished",                :default => false,         :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "group",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tips", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "match_id",     :null => false
    t.integer  "goals_team_1", :null => false
    t.integer  "goals_team_2", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                  :null => false
    t.string   "encrypted_password",                    :null => false
    t.string   "salt",                                  :null => false
    t.string   "mail",                                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",   :default => "",    :null => false
    t.boolean  "admin",              :default => false, :null => false
  end

end
