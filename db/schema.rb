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

ActiveRecord::Schema.define(version: 20171206124032) do

  create_table "charge_schemes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charge_schemes_utilities", id: false, force: :cascade do |t|
    t.integer "charge_scheme_id", null: false
    t.integer "utility_id", null: false
    t.index ["charge_scheme_id"], name: "index_charge_schemes_utilities_on_charge_scheme_id"
    t.index ["utility_id"], name: "index_charge_schemes_utilities_on_utility_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts_landlords", id: false, force: :cascade do |t|
    t.integer "landlord_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id"], name: "index_contacts_landlords_on_contact_id"
    t.index ["landlord_id"], name: "index_contacts_landlords_on_landlord_id"
  end

  create_table "contacts_tenants", id: false, force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id"], name: "index_contacts_tenants_on_contact_id"
    t.index ["tenant_id"], name: "index_contacts_tenants_on_tenant_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "attachable_type"
    t.integer "attachable_id"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.boolean "encrypted", default: false, null: false
    t.string "iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_documents_on_attachable_type_and_attachable_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "landlord_id", null: false
    t.index ["landlord_id"], name: "index_landlords_users_on_landlord_id"
    t.index ["user_id"], name: "index_landlords_users_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.integer "landlord_id"
    t.string "address"
    t.string "postcode"
    t.decimal "size"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "property_id"
    t.decimal "size"
    t.decimal "charge_weight"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_rooms_on_property_id"
  end

  create_table "tenancies", force: :cascade do |t|
    t.string "rentable_type"
    t.integer "rentable_id"
    t.integer "tenant_id"
    t.decimal "rent"
    t.string "rent_period", default: "m", null: false
    t.integer "charge_scheme_id"
    t.integer "rent_payment_day", default: 1, null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_scheme_id"], name: "index_tenancies_on_charge_scheme_id"
    t.index ["rentable_type", "rentable_id"], name: "index_tenancies_on_rentable_type_and_rentable_id"
    t.index ["tenant_id"], name: "index_tenancies_on_tenant_id"
  end

  create_table "tenant_checks", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "document_type"
    t.date "expires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_tenant_checks_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.index ["tenant_id"], name: "index_tenants_users_on_tenant_id"
    t.index ["user_id"], name: "index_tenants_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "utilities", force: :cascade do |t|
    t.string "name"
    t.string "provider_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "utility_charges", force: :cascade do |t|
    t.string "name"
    t.integer "utility_id"
    t.decimal "charge"
    t.boolean "usage_based"
    t.string "usage_unit"
    t.string "length_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utility_id"], name: "index_utility_charges_on_utility_id"
  end

end