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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121006125430) do

  create_table "policy_publisheds", :force => true do |t|
    t.integer  "report_id"
    t.string   "domain"
    t.string   "adkim"
    t.string   "aspf"
    t.string   "p"
    t.string   "pct"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "records", :force => true do |t|
    t.integer  "report_id"
    t.string   "source_ip"
    t.string   "dkim"
    t.integer  "count"
    t.string   "disposition"
    t.string   "spf"
    t.string   "reason_type"
    t.string   "comment"
    t.string   "header_from"
    t.string   "dkim_domain"
    t.string   "dkim_result"
    t.string   "dkim_hresult"
    t.string   "spf_domain"
    t.string   "spf_result"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "org_name"
    t.string   "email"
    t.string   "extra_contact_info"
    t.string   "report_id"
    t.datetime "begin"
    t.datetime "end"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "failed_count"
    t.integer  "passed_count"
  end

end
