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

ActiveRecord::Schema.define(version: 20180124222421) do

  create_table "contacts", force: :cascade do |t|
    t.string "contactable_type"
    t.integer "contactable_id"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.boolean "primary", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.integer "tenancy_id"
    t.decimal "amount"
    t.boolean "refunded", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenancy_id"], name: "index_deposits_on_tenancy_id"
  end

  create_table "document_accesses", force: :cascade do |t|
    t.integer "document_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.text "encrypted_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_accesses_on_document_id"
    t.index ["owner_type", "owner_id"], name: "index_document_accesses_on_owner_type_and_owner_id"
  end

  create_table "document_templates", force: :cascade do |t|
    t.string "name"
    t.boolean "variables", default: false
    t.string "file_type"
    t.string "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "attachable_type"
    t.integer "attachable_id"
    t.string "file_path"
    t.string "file_type"
    t.boolean "encrypted", default: false, null: false
    t.string "iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_documents_on_attachable_type_and_attachable_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "tenant_id"
    t.boolean "issued", default: false, null: false
    t.date "issued_on"
    t.date "due_on"
    t.decimal "balance"
    t.boolean "paid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_invoices_on_tenant_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.text "public_key"
    t.text "private_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_landlords_on_name", unique: true
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "mandates", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "method"
    t.string "reference"
    t.boolean "active", default: false, null: false
    t.boolean "cancelled", default: false, null: false
    t.string "status_message"
    t.string "status_details"
    t.date "last_success"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_mandates_on_tenant_id"
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
    t.index ["name"], name: "index_properties_on_name", unique: true
  end

  create_table "rent_charges", force: :cascade do |t|
    t.decimal "amount"
    t.integer "tenancy_id"
    t.integer "rentable_id"
    t.date "from_date"
    t.date "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rentable_id"], name: "index_rent_charges_on_rentable_id"
    t.index ["tenancy_id"], name: "index_rent_charges_on_tenancy_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "property_id"
    t.decimal "size"
    t.decimal "charge_weight"
    t.boolean "active"
    t.boolean "occupied_override"
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
    t.integer "rent_payment_day", default: 1, null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rentable_type", "rentable_id"], name: "index_tenancies_on_rentable_type_and_rentable_id"
    t.index ["tenant_id"], name: "index_tenancies_on_tenant_id"
  end

  create_table "tenant_applications", force: :cascade do |t|
    t.integer "tenant_id"
    t.boolean "contact_completed", default: false
    t.boolean "form_uploaded", default: false
    t.boolean "reference_received", default: false
    t.boolean "reference_passed"
    t.boolean "check_completed", default: false
    t.boolean "mandate_completed", default: false
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_tenant_applications_on_tenant_id"
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
    t.text "public_key"
    t.text "private_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "invoice_id"
    t.decimal "amount"
    t.string "description"
    t.string "external_reference"
    t.integer "tenancy_id"
    t.string "transactionable_type"
    t.integer "transactionable_id"
    t.boolean "payment", default: false, null: false
    t.boolean "queued", default: true, null: false
    t.boolean "processed", default: true, null: false
    t.date "credit_date"
    t.boolean "failed", default: false, null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
    t.index ["tenancy_id"], name: "index_transactions_on_tenancy_id"
    t.index ["tenant_id"], name: "index_transactions_on_tenant_id"
    t.index ["transactionable_type", "transactionable_id"], name: "index_transactions_on_transactionable"
  end

  create_table "user_associations", force: :cascade do |t|
    t.integer "user_id"
    t.string "associable_type"
    t.integer "associable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["associable_type", "associable_id"], name: "index_user_associations_on_associable_type_and_associable_id"
    t.index ["user_id"], name: "index_user_associations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.integer "contact_id"
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
    t.index ["contact_id"], name: "index_users_on_contact_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "utilities", force: :cascade do |t|
    t.integer "property_id"
    t.string "name"
    t.string "provider_name"
    t.boolean "included_in_rent", default: false, null: false
    t.boolean "prepay_charges", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_utilities_on_property_id"
  end

  create_table "utility_charges", force: :cascade do |t|
    t.integer "utility_id"
    t.decimal "amount"
    t.integer "usage_from_id"
    t.integer "usage_to_id"
    t.date "usage_from_date"
    t.date "usage_to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usage_from_id"], name: "index_utility_charges_on_usage_from_id"
    t.index ["usage_to_id"], name: "index_utility_charges_on_usage_to_id"
    t.index ["utility_id"], name: "index_utility_charges_on_utility_id"
  end

  create_table "utility_prices", force: :cascade do |t|
    t.string "name"
    t.integer "utility_id"
    t.decimal "price"
    t.boolean "usage_based"
    t.string "usage_unit"
    t.string "length_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utility_id"], name: "index_utility_prices_on_utility_id"
  end

  create_table "utility_usages", force: :cascade do |t|
    t.integer "utility_id"
    t.date "date"
    t.decimal "reading"
    t.boolean "projected", default: false, null: false
    t.index ["utility_id"], name: "index_utility_usages_on_utility_id"
  end

end
