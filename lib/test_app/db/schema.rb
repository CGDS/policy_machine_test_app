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

ActiveRecord::Schema.define(version: 20151101013525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "parent_id", null: false
    t.integer "child_id",  null: false
  end

  add_index "assignments", ["child_id"], name: "index_assignments_on_child_id", using: :btree
  add_index "assignments", ["parent_id", "child_id"], name: "index_assignments_on_parent_id_and_child_id", unique: true, using: :btree

  create_table "operations_policy_element_associations", id: false, force: :cascade do |t|
    t.integer "policy_element_association_id", null: false
    t.integer "operation_id",                  null: false
  end

  add_index "operations_policy_element_associations", ["policy_element_association_id", "operation_id"], name: "index_pe_assoc_os_on_assoc_and_o", unique: true, using: :btree

  create_table "policy_element_associations", force: :cascade do |t|
    t.integer "user_attribute_id",   null: false
    t.integer "object_attribute_id", null: false
  end

  add_index "policy_element_associations", ["user_attribute_id", "object_attribute_id"], name: "index_pe_assocs_on_ua_and_oa", using: :btree

  create_table "policy_elements", force: :cascade do |t|
    t.string "unique_identifier",   null: false
    t.string "policy_machine_uuid"
    t.string "type",                null: false
    t.text   "extra_attributes"
  end

  add_index "policy_elements", ["type"], name: "index_policy_elements_on_type", using: :btree
  add_index "policy_elements", ["unique_identifier"], name: "index_policy_elements_on_unique_identifier", unique: true, using: :btree

  create_table "transitive_closure", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
  end

  add_index "transitive_closure", ["ancestor_id", "descendant_id"], name: "index_transitive_closure_on_ancestor_id_and_descendant_id", unique: true, using: :btree
  add_index "transitive_closure", ["descendant_id"], name: "index_transitive_closure_on_descendant_id", using: :btree

end
