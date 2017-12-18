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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171218190256) do

  create_table "rooms", force: :cascade do |t|
    t.string   "type_bien"
    t.string   "type_location"
    t.integer  "nb_personne"
    t.integer  "nb_chambre"
    t.integer  "nb_sdb"
    t.string   "nom_annonce"
    t.text     "description_annonce"
    t.string   "adresse_annonce"
    t.boolean  "is_wifi"
    t.boolean  "is_tv"
    t.boolean  "is_petit_dejeuner"
    t.boolean  "is_cuisine"
    t.boolean  "is_couvert"
    t.boolean  "is_lave_vaisselle"
    t.boolean  "is_cafetiere"
    t.boolean  "is_machine_a_laver"
    t.boolean  "is_table_fer_repasser"
    t.boolean  "is_armoire"
    t.boolean  "is_shampoing"
    t.boolean  "is_climatisation"
    t.boolean  "is_terrasse"
    t.boolean  "is_jardin"
    t.boolean  "is_piscine"
    t.boolean  "is_voiture"
    t.boolean  "is_mer"
    t.boolean  "is_lit_bebe"
    t.boolean  "active"
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "phone_number"
    t.text     "description"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
