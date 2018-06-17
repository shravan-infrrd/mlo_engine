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

ActiveRecord::Schema.define(version: 20180617184933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "access_control_groups", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "system_name"
    t.string "token"
    t.integer "account_id"
    t.text "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "access_statuses", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_settings", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.text "purchase_workflow"
    t.text "refinance_workflow"
    t.text "purchase_document_requests"
    t.text "refinance_document_requests"
    t.boolean "enable_customization", default: false
    t.boolean "enable_custom_requests", default: false
    t.string "custom_export_name"
    t.string "custom_export_url"
    t.string "custom_export_root"
    t.string "custom_export_format"
    t.text "custom_export_mappings"
    t.text "custom_export_value_mappings"
    t.string "custom_export_notes_field"
    t.boolean "enable_velocify", default: false
    t.string "velocify_client_id"
    t.string "velocify_campaign_id"
    t.string "velocify_provider_id"
    t.text "velocify_field_mappings"
    t.text "velocify_value_mappings"
    t.boolean "enable_velocify_updates", default: false
    t.string "velocify_lead_campaign_id"
    t.boolean "enable_velocify_loan_application"
    t.boolean "enable_velocify_leads"
    t.boolean "enable_manual_export", default: false
    t.boolean "enable_custom_confirmation", default: false
    t.integer "export_retry_attempts", default: 1
    t.boolean "mfa_app", default: false
    t.boolean "mfa_email", default: false
    t.boolean "mfa_sms", default: false
    t.boolean "mfa_voice", default: false
    t.boolean "mfa_remember_device", default: false
    t.boolean "mfa_app_borrower", default: false
    t.boolean "mfa_email_borrower", default: false
    t.boolean "mfa_sms_borrower", default: false
    t.boolean "mfa_voice_borrower", default: false
    t.boolean "mfa_remember_device_borrower", default: false
    t.index ["account_id"], name: "index_account_settings_on_account_id"
  end

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.integer "property_id"
    t.string "name"
    t.string "phone"
    t.string "website"
    t.integer "business_type"
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "domains"
    t.text "custom_styles"
    t.text "loan_settings"
    t.text "document_request_settings"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip_code"
    t.boolean "purchase_application_offered"
    t.boolean "refinance_application_offered"
    t.boolean "conventional_loan_offered"
    t.boolean "va_loan_offered"
    t.boolean "fha_loan_offered"
    t.string "conventional_fixed_terms"
    t.string "conventional_arm_terms"
    t.string "conventional_gpm_terms"
    t.string "va_fixed_terms"
    t.string "va_arm_terms"
    t.string "fha_fixed_terms"
    t.string "fha_arm_terms"
    t.string "referral_token"
    t.integer "parent_id"
    t.boolean "enable_encompass"
    t.string "encompass_url"
    t.string "encompass_folder"
    t.text "encompass_template"
    t.boolean "enable_application"
    t.boolean "enable_underwriting"
    t.boolean "enable_closing"
    t.boolean "enable_connections"
    t.boolean "usda_loan_offered"
    t.boolean "heloc_application_offered"
    t.boolean "hel_application_offered"
    t.boolean "enable_team"
    t.boolean "fixed_amortization_offered"
    t.boolean "arm_amortization_offered"
    t.boolean "gpm_amortization_offered"
    t.string "referral_token1"
    t.string "referral_token2"
    t.integer "manager_id"
    t.string "privacy_policy"
    t.string "subdomain"
    t.string "tos"
    t.boolean "enable_user_encompass_folder"
    t.boolean "enable_force_encompass_template"
    t.boolean "enable_save_encompass_password"
    t.boolean "enable_full_service"
    t.string "encompass_version"
    t.boolean "enable_vanity_apps"
    t.string "lead_sources"
    t.string "internal_name"
    t.boolean "enable_income"
    t.boolean "enable_assets"
    t.boolean "enable_credit_authorization"
    t.boolean "enable_lead_form"
    t.boolean "enable_subject_property"
    t.boolean "enable_ssn"
    t.boolean "debug_mode"
    t.boolean "enable_realtor_referral"
    t.boolean "locked"
    t.string "encompass_export_custom_field1_name"
    t.string "encompass_export_custom_field2_name"
    t.string "encompass_export_custom_field3_name"
    t.string "encompass_export_custom_field1_value"
    t.string "encompass_export_custom_field2_value"
    t.string "encompass_export_custom_field3_value"
    t.boolean "enable_instant_messaging"
    t.boolean "enable_license_number"
    t.boolean "enable_timeline"
    t.boolean "enable_standardized_signature"
    t.text "standardized_signature"
    t.boolean "enable_encompass_automatic_export"
    t.boolean "enable_debug"
    t.string "realtor_referral_provider"
    t.boolean "enable_leads"
    t.string "cname"
    t.string "lead_form_path"
    t.string "email"
    t.boolean "signature_photo"
    t.boolean "enable_yodlee"
    t.boolean "enable_application_manager_auto_assign"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean "enable_linkedin"
    t.boolean "enable_loan_type"
    t.datetime "enable_timeline_at"
    t.text "ip_addresses"
    t.boolean "enable_member_ip_filter"
    t.boolean "enable_admin_ip_filter"
    t.integer "style_configuration_id"
    t.datetime "enable_du"
    t.string "du_account_id"
    t.string "temp_pls_delete_du_account_password"
    t.string "du_credit_name"
    t.string "du_credit_account"
    t.string "temp_pls_delete_du_credit_password"
    t.integer "rate_configuration_id"
    t.string "rate_configuration_column_id"
    t.boolean "enable_advanced_fnm"
    t.integer "encompass_configuration_id"
    t.integer "task_configuration_id"
    t.boolean "enable_hmda"
    t.boolean "enable_asset_refresh"
    t.boolean "enable_require_credit_auth"
    t.text "email_disclosures"
    t.datetime "enable_asset_download"
    t.datetime "enable_standardized_welcome_email"
    t.string "welcome_email_subject"
    t.text "welcome_email_content"
    t.datetime "barrier"
    t.integer "custom_export_configuration_id"
    t.integer "sso_configuration_id"
    t.boolean "enable_custom_export"
    t.boolean "enable_pre_approval"
    t.integer "email_configuration_id"
    t.boolean "enable_short_full_service"
    t.integer "retention_period"
    t.integer "fee_configuration_id"
    t.boolean "enable_docmagic"
    t.integer "llpa_configuration_id"
    t.boolean "enable_collaborators"
    t.boolean "va_irrrl_loan_offered"
    t.boolean "enable_fnm_downloads", default: true
    t.boolean "not_sure_loan_offered", default: true
    t.boolean "not_sure_amortization_offered", default: true
    t.string "borrower_cname"
    t.integer "state_configuration_id"
    t.string "license_number"
    t.text "encrypted_du_credit_password"
    t.string "encrypted_du_credit_password_iv"
    t.string "encrypted_du_credit_password_salt"
    t.text "encrypted_du_account_password"
    t.string "encrypted_du_account_password_iv"
    t.string "encrypted_du_account_password_salt"
    t.integer "arm_terms_configuration_id"
    t.string "encompass_export_custom_field4_name"
    t.string "encompass_export_custom_field5_name"
    t.string "encompass_export_custom_field6_name"
    t.string "encompass_export_custom_field7_name"
    t.string "encompass_export_custom_field8_name"
    t.string "encompass_export_custom_field9_name"
    t.string "encompass_export_custom_field10_name"
    t.string "encompass_export_custom_field4_value"
    t.string "encompass_export_custom_field5_value"
    t.string "encompass_export_custom_field6_value"
    t.string "encompass_export_custom_field7_value"
    t.string "encompass_export_custom_field8_value"
    t.string "encompass_export_custom_field9_value"
    t.string "encompass_export_custom_field10_value"
    t.boolean "enable_verification_of_employment"
    t.boolean "enable_task_speedbump", default: false
    t.string "reference_id"
    t.boolean "enable_password_update_rate_limit", default: false
    t.boolean "enable_2018_hmda", default: true
    t.boolean "enable_docusign", default: false
    t.boolean "enforce_unique_loan_application_reference_id", default: false
    t.boolean "enable_docusign_tab_labels", default: false
    t.boolean "enable_docusign_template_mappings", default: false
    t.boolean "enforce_mfa", default: false
    t.boolean "product_selection_enabled", default: false, null: false
    t.string "ancestry"
    t.boolean "enable_self_service", default: true
    t.boolean "enable_document_virus_scan", default: false
    t.boolean "enable_img_to_pdf_conversion", default: false
    t.boolean "enable_document_pdf_password_scan", default: false
    t.boolean "enable_automatic_credit_pull", default: false
    t.integer "maximum_applicants", limit: 2, default: 2
    t.boolean "e_consent_by_default", default: false
    t.boolean "enable_multiple_loan_applications_per_borrower", default: false
    t.boolean "enable_automatic_home_insurance_quote"
    t.boolean "enable_automatic_home_insurance_quote_speedbump", default: false, null: false
    t.index ["ancestry"], name: "index_accounts_on_ancestry"
    t.index ["fee_configuration_id"], name: "index_accounts_on_fee_configuration_id"
    t.index ["llpa_configuration_id"], name: "index_accounts_on_llpa_configuration_id"
    t.index ["parent_id"], name: "index_accounts_on_parent_id"
    t.index ["sso_configuration_id"], name: "index_accounts_on_sso_configuration_id"
    t.index ["token"], name: "index_accounts_on_token", unique: true
  end

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "user_id"
    t.string "action"
    t.string "resource_a_type"
    t.integer "resource_a_id"
    t.string "resource_b_type"
    t.integer "resource_b_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "content"
  end

  create_table "ahoy_events", id: :string, limit: 36, force: :cascade do |t|
    t.string "visit_id"
    t.integer "user_id"
    t.string "name"
    t.text "properties"
    t.datetime "time"
    t.index ["time"], name: "index_ahoy_events_on_time"
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "announcements", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_requests", id: :serial, force: :cascade do |t|
    t.integer "service_id"
    t.text "url"
    t.string "status"
    t.datetime "created_at"
    t.text "content"
  end

  create_table "appointments", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "token"
    t.index ["token"], name: "index_appointments_on_token", unique: true
  end

  create_table "arm_terms_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "owner_id"
    t.string "name"
    t.boolean "shared"
    t.decimal "default_arm_margin", precision: 16, scale: 6
    t.decimal "default_arm_index", precision: 16, scale: 6
    t.decimal "default_arm_first_rate_cap_percent", precision: 16, scale: 6
    t.decimal "default_arm_subsequent_rate_cap_percent", precision: 16, scale: 6
    t.decimal "default_arm_lifetime_rate_cap_percent", precision: 16, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_arm_terms_configurations_on_token"
  end

  create_table "borrower_data", id: :serial, force: :cascade do |t|
    t.string "email"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_borrower_data_on_account_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "content"
    t.index ["commentable_id", "commentable_type"], name: "index_on_commentable"
    t.index ["token"], name: "index_comments_on_token"
  end

  create_table "conditions", id: :serial, force: :cascade do |t|
    t.integer "milestone_id"
    t.string "name"
    t.text "description"
    t.integer "order"
    t.string "token"
    t.datetime "completed_at"
    t.integer "due_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configured_emails", id: :serial, force: :cascade do |t|
    t.string "lifecycle_event", null: false
    t.string "subject"
    t.text "content"
    t.integer "email_configuration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "sender"
    t.string "signature"
    t.boolean "enabled"
    t.index ["email_configuration_id", "lifecycle_event"], name: "index_configured_emails_on_email_config_id_and_lifecycle_event", unique: true
    t.index ["email_configuration_id"], name: "index_configured_emails_on_email_configuration_id"
  end

  create_table "consents", id: :serial, force: :cascade do |t|
    t.string "kind"
    t.string "token"
    t.integer "loan_application_id"
    t.integer "provider_id"
    t.string "status"
    t.datetime "provided_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_consents_on_token"
  end

  create_table "credit_reports", id: :serial, force: :cascade do |t|
    t.integer "loan_application_id"
    t.string "token"
    t.text "content"
    t.string "reference_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "requested_type"
    t.index ["loan_application_id"], name: "index_credit_reports_on_loan_application_id"
    t.index ["token"], name: "index_credit_reports_on_token"
  end

  create_table "custom_export_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.boolean "shared"
    t.string "custom_export_name"
    t.string "custom_export_url"
    t.string "custom_export_root"
    t.string "custom_export_format"
    t.text "custom_export_mappings"
    t.text "custom_export_value_mappings"
    t.string "custom_export_notes_field"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "encrypted_basic_auth_token"
    t.string "encrypted_basic_auth_token_iv"
    t.string "encrypted_basic_auth_token_salt"
    t.string "request_type"
    t.boolean "enable_automatic_export", default: false
    t.index ["token"], name: "index_custom_export_configurations_on_token"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "delayed_runners", id: :serial, force: :cascade do |t|
    t.string "token"
    t.text "payload"
    t.text "last_error"
    t.string "type"
    t.integer "skipper_id"
    t.datetime "skipped_at"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_id"
    t.integer "user_id"
    t.integer "loan_application_id"
    t.integer "document_id"
    t.integer "document_request_id"
    t.integer "percent_complete", default: 0
    t.integer "status_update_id"
    t.index ["loan_application_id"], name: "index_delayed_runners_on_loan_application_id"
    t.index ["token"], name: "index_delayed_runners_on_token"
  end

  create_table "desktop_underwriter_reports", id: :serial, force: :cascade do |t|
    t.integer "loan_application_id"
    t.string "token"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["loan_application_id"], name: "index_desktop_underwriter_reports_on_loan_application_id"
    t.index ["token"], name: "index_desktop_underwriter_reports_on_token"
  end

  create_table "document_requests", id: :serial, force: :cascade do |t|
    t.string "documentable_type"
    t.integer "documentable_id"
    t.integer "assignee_id"
    t.string "document_type"
    t.text "description"
    t.date "date"
    t.integer "status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "document_name"
    t.text "reason"
    t.string "external_id"
    t.string "external_origin"
    t.datetime "due_at"
    t.string "token"
    t.string "service_id"
    t.string "reference_id"
    t.datetime "completed_at"
    t.text "instructions"
    t.string "type_id"
    t.string "assigned_role"
    t.text "extension_data"
    t.boolean "restricted", default: false
    t.string "completed_by_reference_id"
    t.boolean "release_automatically", default: true
    t.datetime "released_at"
    t.integer "priority"
    t.string "categories"
    t.datetime "deleted_at"
    t.integer "deleted_by_user_id"
    t.index ["assignee_id"], name: "index_document_requests_on_assignee_id"
    t.index ["documentable_id", "documentable_type"], name: "index_on_documentable"
    t.index ["token"], name: "index_document_requests_on_token", unique: true
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.integer "uploader_id"
    t.integer "workflow_id"
    t.integer "num_of_pages"
    t.integer "status", default: 1
    t.integer "parent_id"
    t.boolean "deleted", default: false
    t.string "form_type"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "document_request_id"
    t.string "token"
    t.string "service_id"
    t.string "reference_id"
    t.datetime "exported_at"
    t.string "processing_status"
    t.datetime "export_at"
    t.string "export_status"
    t.text "export_response"
    t.string "export_reference_id"
    t.text "remote_url"
    t.string "type_id"
    t.integer "loan_application_id"
    t.datetime "scrubbed_at"
    t.string "remote_source_url"
    t.datetime "last_downloaded_at"
    t.integer "last_downloaded_by_user_id"
    t.datetime "virus_scanned_at"
    t.string "legacy_file_key"
    t.string "file_iv"
    t.string "file_salt"
    t.string "encrypted_file_key"
    t.string "encrypted_file_key_iv"
    t.string "categories"
    t.string "encrypted_file_key_salt"
    t.bigint "oauth_provider_id"
    t.index ["document_request_id"], name: "index_documents_on_document_request_id"
    t.index ["oauth_provider_id"], name: "index_documents_on_oauth_provider_id"
    t.index ["token"], name: "index_documents_on_token", unique: true
  end

  create_table "documents_loan_applications", id: false, force: :cascade do |t|
    t.integer "loan_application_id"
    t.integer "document_id"
  end

  create_table "documents_offers", id: false, force: :cascade do |t|
    t.integer "offer_id"
    t.integer "document_id"
  end

  create_table "email_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.boolean "shared"
    t.boolean "enable_standardized_borrower_referral"
    t.boolean "enable_standardized_welcome"
    t.boolean "enable_standardized_signature"
    t.text "disclosures"
    t.string "borrower_referral_email_subject"
    t.text "borrower_referral_email_content"
    t.string "welcome_email_subject"
    t.text "welcome_email_content"
    t.text "standardized_signature"
    t.boolean "signature_photo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enable_emails", default: true
    t.boolean "customize_referral_url", default: false
    t.string "custom_referral_url", default: ""
    t.text "standardized_generic_signature"
    t.index ["owner_id"], name: "index_email_configurations_on_owner_id"
    t.index ["token"], name: "index_email_configurations_on_token"
  end

  create_table "encompass_configurations", id: :serial, force: :cascade do |t|
    t.string "encrypted_encompass_username"
    t.string "encrypted_encompass_username_iv"
    t.string "encrypted_encompass_username_salt"
    t.string "encrypted_encompass_password"
    t.string "encrypted_encompass_password_iv"
    t.string "encrypted_encompass_password_salt"
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.boolean "shared"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "export_method"
    t.index ["token"], name: "index_encompass_configurations_on_token"
  end

  create_table "escrow_item_types", id: :serial, force: :cascade do |t|
    t.integer "fee_configuration_id"
    t.string "name"
    t.string "loan_estimate_section"
    t.string "mismo_enumerable"
    t.string "default_monthly_payment_amount"
    t.string "default_number_of_collected_months"
    t.boolean "selected_by_default", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "details_of_transaction_line_item"
  end

  create_table "escrow_items", id: :serial, force: :cascade do |t|
    t.integer "escrow_item_type_id"
    t.integer "loan_application_id"
    t.string "monthly_payment_amount"
    t.string "number_of_collected_months"
    t.datetime "disbursement_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_statuses", id: :serial, force: :cascade do |t|
    t.integer "webhook_event_id"
    t.string "code"
    t.string "title"
    t.string "detail"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "eventable_id"
    t.string "eventable_type"
    t.string "event_type"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_id"
    t.index ["account_id"], name: "index_events_on_account_id"
    t.index ["eventable_id", "eventable_type"], name: "index_on_eventable"
    t.index ["token"], name: "index_events_on_token", unique: true
  end

  create_table "exports", id: :serial, force: :cascade do |t|
    t.integer "loan_id"
    t.integer "user_id"
    t.string "encrypted_username"
    t.string "encrypted_username_iv"
    t.string "encrypted_username_salt"
    t.string "encrypted_password"
    t.string "encrypted_password_iv"
    t.string "encrypted_password_salt"
    t.text "url"
    t.string "type"
    t.text "payload"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "request_content"
    t.text "response_content"
    t.string "status"
    t.datetime "completed_at"
    t.string "token"
    t.integer "exportable_id"
    t.string "exportable_type"
    t.integer "account_id"
    t.boolean "automatic", default: false
    t.integer "retry_attempts"
    t.index ["account_id"], name: "index_exports_on_account_id"
    t.index ["exportable_id", "exportable_type"], name: "index_on_exportable"
    t.index ["token"], name: "index_exports_on_token"
  end

  create_table "fee_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.boolean "shared"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.index ["token"], name: "index_fee_configurations_on_token"
  end

  create_table "fee_types", id: :serial, force: :cascade do |t|
    t.integer "fee_configuration_id"
    t.string "name", null: false
    t.string "loan_estimate_section", null: false
    t.string "mismo_enumerable", null: false
    t.float "default_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "selected_by_default", default: false
    t.string "default_paid_to_type"
    t.string "details_of_transaction_line_item"
    t.index ["fee_configuration_id"], name: "index_fee_types_on_fee_configuration_id"
  end

  create_table "fees", id: :serial, force: :cascade do |t|
    t.integer "fee_type_id"
    t.integer "loan_application_id"
    t.float "amount", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "paid_to_type"
    t.index ["loan_application_id"], name: "index_fees_on_loan_application_id"
  end

  create_table "homeowners_insurance_quotes", force: :cascade do |t|
    t.string "matic_lead_id", null: false
    t.integer "loan_application_id", null: false
    t.datetime "quote_initiated_at"
    t.datetime "quote_ready_at"
    t.datetime "policy_ready_at"
    t.datetime "quote_selected_at"
    t.datetime "quote_terminated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imports", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "type"
    t.integer "importable_id"
    t.string "importable_type"
    t.text "encrypted_pl"
    t.text "encrypted_pl_iv"
    t.text "encrypted_pl_salt"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["importable_id", "importable_type"], name: "index_on_importable"
    t.index ["token"], name: "index_imports_on_token"
  end

  create_table "instant_message_views", id: :serial, force: :cascade do |t|
    t.integer "loan_application_id"
    t.integer "user_id"
    t.datetime "last_typed_at"
    t.datetime "last_viewed_at"
    t.index ["user_id", "loan_application_id"], name: "index_instant_message_views_on_user_id_and_loan_application_id", unique: true
  end

  create_table "instant_messages", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "loan_application_id"
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "automatic", default: false
    t.index ["loan_application_id"], name: "index_instant_messages_on_loan_application_id"
    t.index ["token"], name: "index_instant_messages_on_token"
    t.index ["user_id"], name: "index_instant_messages_on_user_id"
  end

  create_table "integration_service_settings", id: :serial, force: :cascade do |t|
    t.integer "integration_id", null: false
    t.integer "service_setting_id", null: false
    t.text "encrypted_value", null: false
    t.string "encrypted_value_iv", null: false
    t.string "encrypted_value_salt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "integrations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "account_id"
    t.integer "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status_id", default: 0
    t.index ["account_id", "service_id"], name: "index_integrations_on_account_id_and_service_id", unique: true
    t.index ["token"], name: "index_integrations_on_token", unique: true
  end

  create_table "ipster_blocked_addresses", id: :serial, force: :cascade do |t|
    t.integer "event_id"
    t.string "ip_address"
    t.integer "blocked_count"
    t.text "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_id"], name: "index_ipster_blocked_addresses_on_event_id"
    t.index ["ip_address"], name: "index_ipster_blocked_addresses_on_ip_address"
  end

  create_table "ipster_events", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "ip_address"
    t.string "reason"
    t.text "context"
    t.text "request"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ip_address", "user_id"], name: "index_ipster_events_on_ip_address_and_user_id"
  end

  create_table "leads", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "velocify_lead_id"
    t.datetime "archived_at"
    t.text "encrypted_payload"
    t.string "encrypted_payload_iv"
    t.string "encrypted_payload_salt"
    t.string "lending_tree_tracking_number"
    t.string "b_first_name"
    t.string "b_last_name"
    t.string "export_type"
    t.index ["account_id"], name: "index_leads_on_account_id"
    t.index ["lending_tree_tracking_number"], name: "index_leads_on_lending_tree_tracking_number", unique: true
    t.index ["token"], name: "index_leads_on_token"
  end

  create_table "llpa_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.text "llpa_table"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_llpa_configurations_on_token"
  end

  create_table "loan_application_notes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "loan_application_id"
    t.text "context"
    t.text "content"
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["loan_application_id"], name: "index_loan_application_notes_on_loan_application_id"
    t.index ["token"], name: "index_loan_application_notes_on_token"
  end

  create_table "loan_application_reference_ids", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "reference_id"
    t.integer "loan_application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_applications", id: :serial, force: :cascade do |t|
    t.string "long_id"
    t.integer "creator_id"
    t.datetime "completed_at"
    t.datetime "submitted_at"
    t.string "b_first_name"
    t.string "b_last_name"
    t.string "b_email"
    t.string "b_phone"
    t.date "b_dob"
    t.string "encrypted_b_ssn"
    t.string "encrypted_b_ssn_iv"
    t.string "encrypted_b_ssn_salt"
    t.string "b_marital_status", default: "0"
    t.string "b_dependents"
    t.text "b_address"
    t.text "b_mailing_address"
    t.text "b_employment"
    t.string "b_self_employment"
    t.boolean "b_recent_ownership"
    t.boolean "b_has_judgements"
    t.boolean "b_has_bankruptcy"
    t.boolean "b_has_property_foreclosure"
    t.boolean "b_has_loan_foreclosure"
    t.boolean "b_has_lawsuit"
    t.boolean "b_has_default"
    t.boolean "b_down_payment_borrowed"
    t.string "b_ongoing_payments"
    t.boolean "b_quarter_ownership"
    t.boolean "b_citizen"
    t.boolean "b_alien"
    t.boolean "b_note_debt"
    t.boolean "has_coborrower"
    t.boolean "coborrower_spouse"
    t.boolean "coborrower_shared_address"
    t.string "c_first_name"
    t.string "c_last_name"
    t.string "c_email"
    t.string "c_phone"
    t.date "c_dob"
    t.string "encrypted_c_ssn"
    t.string "encrypted_c_ssn_iv"
    t.string "encrypted_c_ssn_salt"
    t.string "c_marital_status", default: "0"
    t.string "c_dependents"
    t.text "c_address"
    t.text "c_mailing_address"
    t.text "c_employment"
    t.string "c_self_employment"
    t.boolean "c_recent_ownership"
    t.boolean "c_has_judgements"
    t.boolean "c_has_bankruptcy"
    t.boolean "c_has_property_foreclosure"
    t.boolean "c_has_loan_foreclosure"
    t.boolean "c_has_lawsuit"
    t.boolean "c_has_default"
    t.boolean "c_down_payment_borrowed"
    t.string "c_ongoing_payments"
    t.boolean "c_quarter_ownership"
    t.boolean "c_citizen"
    t.boolean "c_alien"
    t.boolean "c_note_debt"
    t.string "application_type"
    t.string "loan_type"
    t.string "amortization"
    t.string "mortgage_type"
    t.string "property_use"
    t.string "property_sale_stage"
    t.string "down_payment_method"
    t.decimal "loan_amount", precision: 9, scale: 2
    t.boolean "max_loan_amount"
    t.decimal "down_payment", precision: 9, scale: 2
    t.boolean "declined_down_payment"
    t.integer "sale_proceeds"
    t.string "b_owned_property_use"
    t.string "b_owned_property_title"
    t.datetime "b_discharged_at"
    t.boolean "b_va_ros"
    t.boolean "b_va_coe"
    t.datetime "c_discharged_at"
    t.boolean "c_va_ros"
    t.boolean "c_va_coe"
    t.integer "b_monthly_income"
    t.integer "b_monthly_expenses"
    t.integer "c_monthly_income"
    t.integer "c_monthly_expenses"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "c_owned_property_use"
    t.string "c_owned_property_title"
    t.boolean "b_life_insurance"
    t.boolean "c_life_insurance"
    t.boolean "b_military_service"
    t.boolean "c_military_service"
    t.text "b_properties"
    t.text "c_properties"
    t.boolean "b_other_mailing"
    t.boolean "c_other_mailing"
    t.boolean "b_current_ownership"
    t.boolean "c_current_ownership"
    t.integer "arm_fixed_term"
    t.string "token"
    t.string "service_id"
    t.string "reference_id"
    t.datetime "started_at"
    t.integer "coborrower_id"
    t.string "b_middle_initial"
    t.string "c_middle_initial"
    t.string "b_years_schooling"
    t.string "c_years_schooling"
    t.boolean "b_recently_employed"
    t.boolean "c_recently_employed"
    t.string "amortization_term"
    t.datetime "exported_at"
    t.datetime "visited_at"
    t.integer "borrower_id"
    t.string "first_last_question"
    t.string "second_last_question"
    t.string "third_last_question"
    t.text "b_incomes"
    t.text "c_incomes"
    t.string "lead_source"
    t.string "lead_stage"
    t.text "subject_property"
    t.boolean "b_allow_credit"
    t.datetime "b_allow_credit_at"
    t.boolean "c_allow_credit"
    t.datetime "c_allow_credit_at"
    t.string "b_estimated_credit"
    t.string "c_estimated_credit"
    t.text "b_assets"
    t.text "c_assets"
    t.text "b_liabilities"
    t.text "c_liabilities"
    t.boolean "b_other_income"
    t.boolean "c_other_income"
    t.text "encrypted_loan_application"
    t.string "encrypted_loan_application_iv"
    t.string "encrypted_loan_application_salt"
    t.text "answer_sources"
    t.text "notes"
    t.boolean "has_realtor"
    t.boolean "wants_realtor"
    t.string "realtor_email"
    t.integer "account_id"
    t.string "velocify_lead_id"
    t.integer "lead_id"
    t.datetime "archived_at"
    t.string "property_photo_file_name"
    t.string "property_photo_content_type"
    t.integer "property_photo_file_size"
    t.datetime "property_photo_updated_at"
    t.string "export_reference_id"
    t.string "b_military_branch"
    t.string "c_military_branch"
    t.string "b_military_status"
    t.string "c_military_status"
    t.string "b_military_type"
    t.string "c_military_type"
    t.boolean "b_first_va_loan"
    t.boolean "c_first_va_loan"
    t.string "b_va_funding_fee_exempt"
    t.string "c_va_funding_fee_exempt"
    t.boolean "full_service"
    t.string "name"
    t.integer "submitter_id"
    t.integer "percent_complete"
    t.integer "b_credit_authed_by"
    t.integer "c_credit_authed_by"
    t.datetime "scrubbed_at"
    t.text "proposed_housing_expenses"
    t.string "b_credit_score"
    t.string "loan_to_value_ratio"
    t.float "loan_level_price_adjustment"
    t.string "encrypted_encryption_key"
    t.string "encrypted_encryption_key_iv"
    t.string "encrypted_encryption_key_salt"
    t.decimal "arm_margin", precision: 16, scale: 6
    t.decimal "arm_index", precision: 16, scale: 6
    t.decimal "arm_ceiling_rate", precision: 16, scale: 6
    t.decimal "arm_floor_rate", precision: 16, scale: 6
    t.decimal "arm_first_rate_cap_percent", precision: 16, scale: 6
    t.decimal "arm_subsequent_rate_cap_percent", precision: 16, scale: 6
    t.decimal "arm_lifetime_rate_cap_percent", precision: 16, scale: 6
    t.integer "arm_first_rate_change_months"
    t.integer "arm_subsequent_rate_change_months"
    t.decimal "payoff_amount", precision: 12, scale: 2
    t.integer "purpose_of_refinance", default: 0
    t.integer "cash_out_determination_type"
    t.decimal "seller_credit_amount", precision: 9, scale: 2
    t.string "title_in_name_held"
    t.string "manner_in_title_held"
    t.decimal "subordinate_financing_amount", precision: 9, scale: 2
    t.decimal "lender_credit_amount", precision: 9, scale: 2
    t.decimal "earnest_money_amount", precision: 9, scale: 2
    t.string "application_taken_method"
    t.string "docmagic_plan_code"
    t.boolean "disclosures_rate_lock_status_type"
    t.string "disclosures_rate_lock_datetime"
    t.string "c_credit_score"
    t.string "usda_agency_case_number"
    t.boolean "b_econsent_status"
    t.boolean "c_econsent_status"
    t.datetime "b_econsented_at"
    t.datetime "c_econsented_at"
    t.string "encrypted_loan_number"
    t.integer "status", default: 0
    t.datetime "state_changed_at"
    t.string "applicant_loan_name"
    t.integer "loan_goal"
    t.index ["account_id"], name: "index_loan_applications_on_account_id"
    t.index ["submitted_at"], name: "index_loan_applications_on_submitted_at"
    t.index ["token"], name: "index_loan_applications_on_token", unique: true
  end

  create_table "loans", id: :serial, force: :cascade do |t|
    t.integer "creator_id"
    t.integer "loan_application_id"
    t.integer "workflow_id"
    t.string "name"
    t.datetime "visited_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "property_id"
    t.integer "sale_type"
    t.integer "purchase_price"
    t.date "accepted_on"
    t.integer "down_payment"
    t.integer "loan_amount"
    t.date "financing_contingency"
    t.date "appraisal_contingency"
    t.date "close_of_escrow"
    t.datetime "reviewed_at"
    t.datetime "approved_at"
    t.datetime "denied_at"
    t.datetime "closed_at"
    t.datetime "archived_at"
    t.string "property_photo_file_name"
    t.string "property_photo_content_type"
    t.integer "property_photo_file_size"
    t.datetime "property_photo_updated_at"
    t.datetime "export_at"
    t.string "export_status"
    t.text "export_response"
    t.string "export_reference_id"
  end

  create_table "login_attempts", id: :serial, force: :cascade do |t|
    t.string "email"
    t.integer "failed_attempts", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_login_attempts_on_email", unique: true
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.boolean "primary_account", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_memberships_on_account_id"
    t.index ["user_id", "account_id"], name: "index_memberships_on_user_id_and_account_id", unique: true
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.string "thread_id"
    t.integer "parent_id"
    t.integer "workflow_id"
    t.integer "task_id"
    t.integer "from_id"
    t.integer "to_id"
    t.string "subject"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "token"
    t.string "service_id"
    t.string "reference_id"
    t.integer "account_id"
    t.integer "loan_application_id"
    t.text "to_emails"
    t.text "cc_emails"
    t.text "bcc_emails"
    t.text "from_email"
    t.string "status"
    t.text "response"
    t.string "type_id"
    t.index ["account_id", "loan_application_id"], name: "index_messages_on_account_id_and_loan_application_id"
    t.index ["account_id"], name: "index_messages_on_account_id"
    t.index ["from_email"], name: "index_messages_on_from_email"
    t.index ["loan_application_id"], name: "index_messages_on_loan_application_id"
    t.index ["thread_id"], name: "index_messages_on_thread_id"
    t.index ["to_emails"], name: "index_messages_on_to_emails"
    t.index ["token"], name: "index_messages_on_token", unique: true
  end

  create_table "milestone_lists", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.boolean "active"
    t.string "application_type"
    t.string "mortgage_type"
    t.string "amortization_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", id: :serial, force: :cascade do |t|
    t.integer "milestone_list_id"
    t.integer "loan_application_id"
    t.string "name"
    t.text "description"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer "due_days"
    t.integer "order"
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mlo_cities", force: :cascade do |t|
    t.string "city_name", default: ""
    t.string "zipcode", default: ""
    t.integer "county_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mlo_counties", force: :cascade do |t|
    t.string "county_name", default: ""
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mlo_county_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "county_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mlo_states", force: :cascade do |t|
    t.string "state_name", default: ""
    t.string "state_code", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mortgage_insurances", id: :serial, force: :cascade do |t|
    t.integer "loan_application_id"
    t.float "monthly_payment_amount"
    t.integer "number_of_collected_months"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_grants", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "oauth_providers", force: :cascade do |t|
    t.string "name"
    t.bigint "account_id"
    t.string "client_id"
    t.string "client_secret"
    t.string "grant_type"
    t.string "oauth_provider_scope"
    t.string "request_token_url"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.boolean "requesting_token", default: false
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_oauth_providers_on_account_id"
  end

  create_table "offers", id: :serial, force: :cascade do |t|
    t.integer "creator_id"
    t.integer "workflow_id"
    t.integer "parent_id"
    t.integer "counter_id"
    t.integer "actioner_id"
    t.integer "status", default: 0
    t.integer "contract_id"
    t.boolean "buyer"
    t.integer "property_id"
    t.integer "buyer_property_id"
    t.integer "purchase_price", default: 0
    t.integer "down_payment", default: 0
    t.integer "loan_amount", default: 0
    t.integer "earnest_money", default: 0
    t.integer "earnest_money_type"
    t.text "appliances"
    t.integer "title_period"
    t.integer "closing_period"
    t.date "closing_date"
    t.date "accepted_date"
    t.integer "expiration_period"
    t.boolean "financing_required", default: false
    t.boolean "inspection_required", default: false
    t.boolean "appraisal_required", default: false
    t.boolean "sale_required", default: false
    t.boolean "main_residence", default: true
    t.boolean "buyer_is_entity", default: false
    t.string "buyer_entity_name"
    t.boolean "buyer_has_partner", default: false
    t.boolean "buyer_partner_signs", default: false
    t.integer "buyer_sale_property_id"
    t.integer "buyer_sale_status"
    t.date "buyer_sale_escrow_date"
    t.string "buyer_sale_title"
    t.boolean "deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "title_required", default: true
    t.integer "financing_period"
    t.integer "inspection_period"
    t.integer "sale_period"
    t.integer "appraisal_period"
    t.text "inspections"
  end

  create_table "old_passwords", id: :serial, force: :cascade do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type", null: false
    t.integer "password_archivable_id", null: false
    t.datetime "created_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "possessions", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "approval_token"
    t.integer "account_id"
    t.integer "user_id"
    t.integer "requestor_id"
    t.integer "approver_id"
    t.text "reason"
    t.datetime "approved_at"
    t.datetime "denied_at"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prepaid_item_types", id: :serial, force: :cascade do |t|
    t.integer "fee_configuration_id"
    t.string "name", null: false
    t.string "loan_estimate_section", null: false
    t.string "mismo_enumerable", null: false
    t.float "default_amount"
    t.integer "default_months"
    t.integer "default_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "selected_by_default", default: false
    t.string "details_of_transaction_line_item"
  end

  create_table "prepaid_items", id: :serial, force: :cascade do |t|
    t.integer "prepaid_item_type_id"
    t.integer "loan_application_id"
    t.float "amount", null: false
    t.integer "months"
    t.integer "days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["loan_application_id"], name: "index_prepaid_items_on_loan_application_id"
  end

  create_table "product_selections", force: :cascade do |t|
    t.bigint "loan_application_id", null: false
    t.bigint "service_id", null: false
    t.text "selected_product"
    t.text "available_products"
    t.integer "refresh_number", default: 0, null: false
    t.datetime "products_fetched_at"
    t.datetime "products_invalidated_at"
    t.datetime "selection_chosen_at"
    t.datetime "selection_invalidated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_product_selections_on_loan_application_id"
    t.index ["service_id"], name: "index_product_selections_on_service_id"
  end

  create_table "properties", id: :serial, force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip_code"
    t.string "property_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queries", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "account_id"
    t.string "name"
    t.text "query"
    t.string "frequency"
    t.integer "day_of_the_week"
    t.datetime "last_run_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_queries_on_token", unique: true
  end

  create_table "query_results", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "query_id"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_query_results_on_token", unique: true
  end

  create_table "rate_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.text "content"
    t.boolean "shared"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_rate_configurations_on_token"
  end

  create_table "repairs", id: :serial, force: :cascade do |t|
    t.integer "inspection_report_id"
    t.integer "workflow_id"
    t.integer "task_id"
    t.string "inspection_type"
    t.string "reason"
    t.decimal "cost"
    t.datetime "closed_at"
    t.boolean "will_repair"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "repair_estimate_id"
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "type"
    t.text "payload"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer "account_id"
    t.index ["account_id"], name: "index_reports_on_account_id"
    t.index ["token"], name: "index_reports_on_token"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_id", "resource_type", "name"], name: "index_roles_on_resource_id_and_resource_type_and_name"
  end

  create_table "secure_messages", id: :serial, force: :cascade do |t|
    t.text "encrypted_message"
    t.string "encrypted_message_iv"
    t.string "encrypted_message_salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_settings", id: :serial, force: :cascade do |t|
    t.integer "service_id"
    t.string "name"
    t.string "input_type"
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["token"], name: "index_service_settings_on_token"
  end

  create_table "services", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "description"
    t.string "website"
    t.string "access_token"
    t.boolean "active", default: false, null: false
    t.boolean "loan_applications", default: false, null: false
    t.boolean "loan_applications_export", default: false, null: false
    t.boolean "tasks", default: false, null: false
    t.boolean "document_requests", default: false, null: false
    t.boolean "documents", default: false, null: false
    t.boolean "messages", default: false, null: false
    t.boolean "appointments", default: false, null: false
    t.boolean "account_settings", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "user_settings", default: false, null: false
    t.boolean "status_updates", default: false, null: false
    t.boolean "settings", default: false, null: false
    t.text "whitelist_parameters"
    t.boolean "disclosures", default: false, null: false
    t.boolean "style_configurations", default: false
    t.boolean "enable_draft"
    t.boolean "user_management"
    t.string "classification"
    t.boolean "queries", default: false
    t.boolean "query_results", default: false
    t.boolean "state_configurations", default: false
    t.boolean "leads", default: false
    t.boolean "offerings", default: false
    t.boolean "velocify", default: false, null: false
    t.index ["access_token"], name: "index_services_on_access_token", unique: true
    t.index ["token"], name: "index_services_on_token", unique: true
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "signatures", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "width"
    t.integer "height"
    t.boolean "deleted", default: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sso_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.integer "owner_id"
    t.boolean "shared"
    t.boolean "enable_registration"
    t.string "target_url"
    t.text "public_cert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enable_sign_in"
    t.string "subject_type"
    t.boolean "enable_separate_borrower_sso", default: false
    t.string "borrower_target_url"
    t.text "borrower_public_cert"
    t.string "custom_name_identifier"
    t.string "borrower_subject_type"
    t.string "borrower_custom_name_identifier"
    t.index ["owner_id"], name: "index_sso_configurations_on_owner_id"
    t.index ["token"], name: "index_sso_configurations_on_token"
  end

  create_table "state_changes", id: :serial, force: :cascade do |t|
    t.string "state"
    t.integer "user_id"
    t.integer "document_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "token"
    t.index ["token"], name: "index_state_changes_on_token"
  end

  create_table "state_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.integer "owner_id"
    t.boolean "shared"
    t.text "selected_states"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_state_configurations_on_owner_id"
    t.index ["token"], name: "index_state_configurations_on_token"
  end

  create_table "status_updates", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "updateable_id"
    t.string "updateable_type"
    t.integer "user_id"
    t.string "update_type"
    t.text "update_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "comments_count", default: 0, null: false
    t.string "i18n_key"
    t.string "i18n_data"
    t.index ["token"], name: "index_status_updates_on_token"
    t.index ["updateable_id", "updateable_type"], name: "index_on_updateable"
  end

  create_table "style_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.text "styles"
    t.boolean "shared"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "custom_css"
    t.index ["token"], name: "index_style_configurations_on_token"
  end

  create_table "task_configurations", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "owner_id"
    t.string "name"
    t.boolean "shared"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_task_configurations_on_token"
  end

  create_table "task_dependencies", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_lists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "token"
    t.integer "owner_id"
    t.boolean "shared"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "task_configuration_id"
    t.boolean "auto_run", default: false
    t.index ["task_configuration_id"], name: "index_task_lists_on_task_configuration_id"
    t.index ["token"], name: "index_task_lists_on_token"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "category"
    t.boolean "action_required"
    t.integer "status"
    t.string "roles"
    t.integer "close_type"
    t.integer "0"
    t.integer "workflow_id"
    t.integer "closer_id"
    t.text "text_field"
    t.datetime "due"
    t.datetime "completed"
    t.datetime "closed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "token"
    t.string "service_id"
    t.string "reference_id"
    t.string "title"
    t.text "description"
    t.string "name"
    t.index ["token"], name: "index_tasks_on_token", unique: true
    t.index ["workflow_id", "name"], name: "index_tasks_on_workflow_id_and_name", unique: true
  end

  create_table "tax_returns", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "loan_application_id"
    t.string "type"
    t.text "encrypted_content"
    t.string "encrypted_content_salt"
    t.string "encrypted_content_iv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_tax_returns_on_token"
  end

  create_table "user_service_settings", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "service_id", null: false
    t.integer "service_setting_id", null: false
    t.string "encrypted_value"
    t.string "encrypted_value_iv"
    t.string "encrypted_value_salt"
    t.index ["user_id", "service_setting_id"], name: "index_user_service_settings_on_user_id_and_service_setting_id", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "internal_email"
    t.string "home_phone"
    t.string "mobile_phone"
    t.integer "creator_id"
    t.integer "account_id"
    t.integer "license"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "enabled", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "notifications_reviewed_at"
    t.string "referral_token"
    t.text "linkedin_uid"
    t.text "linkedin_token"
    t.integer "service_id"
    t.boolean "email_task_digest", default: true
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "encompass_url"
    t.string "encompass_username"
    t.string "encompass_folder"
    t.text "encompass_template"
    t.string "referral_token1"
    t.string "referral_token2"
    t.string "last_browser_used"
    t.string "encrypted_encompass_password"
    t.string "encrypted_encompass_password_iv"
    t.string "encrypted_encompass_password_salt"
    t.text "welcome_email_subject"
    t.text "welcome_email_content"
    t.string "lead_sources"
    t.text "email_signature"
    t.datetime "last_active_at"
    t.string "token"
    t.text "encompass_templates"
    t.string "encompass_templates_status"
    t.text "encompass_templates_response"
    t.string "license_number"
    t.boolean "enable_instant_messaging"
    t.integer "yodlee_id"
    t.string "yodlee_session_token"
    t.string "im_away_message"
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.boolean "otp_required_for_login"
    t.boolean "signature_photo", default: false
    t.integer "consumed_timestep"
    t.string "borrower_referral_email_subject"
    t.text "borrower_referral_email_content"
    t.string "sso_reference_id"
    t.datetime "last_activity_at"
    t.datetime "expired_at"
    t.datetime "password_changed_at"
    t.string "reference_id"
    t.integer "password_update_attempts", default: 0
    t.string "job_title"
    t.string "current_sign_in_token"
    t.datetime "last_request_at"
    t.integer "access_control_group_id"
    t.text "otp_backup_codes"
    t.string "subdomain", default: ""
    t.string "bio", default: ""
    t.string "address", default: ""
    t.string "nmls_id", default: ""
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email", "account_id"], name: "index_users_on_email_and_account_id", unique: true
    t.index ["expired_at"], name: "index_users_on_expired_at"
    t.index ["internal_email"], name: "index_users_on_internal_email", unique: true
    t.index ["last_activity_at"], name: "index_users_on_last_activity_at"
    t.index ["referral_token"], name: "index_users_on_referral_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["token"], name: "index_users_on_token"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "token"
    t.index ["role_id", "id"], name: "index_users_roles_on_role_id_and_id"
    t.index ["role_id", "user_id"], name: "index_users_roles_on_role_id_and_user_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "visits", id: :string, limit: 36, force: :cascade do |t|
    t.string "visitor_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.text "landing_page"
    t.integer "user_id"
    t.string "referring_domain"
    t.string "search_keyword"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  create_table "webhook_events", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "event_id"
    t.integer "webhook_id"
    t.integer "attempts"
    t.datetime "first_attempt_at"
    t.datetime "last_attempt_at"
    t.datetime "success_at"
    t.datetime "failure_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "error_message"
    t.index ["token"], name: "index_webhook_events_on_token", unique: true
  end

  create_table "webhooks", id: :serial, force: :cascade do |t|
    t.string "token"
    t.integer "service_id"
    t.text "url"
    t.string "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "oauth_provider_id"
    t.index ["oauth_provider_id"], name: "index_webhooks_on_oauth_provider_id"
    t.index ["token"], name: "index_webhooks_on_token", unique: true
  end

  create_table "workflows", id: :serial, force: :cascade do |t|
    t.integer "property_id"
    t.integer "creator_id"
    t.boolean "deleted", default: false
    t.integer "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "mode"
    t.text "payload"
    t.string "name"
  end

  create_table "yodlee_credentials", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "encrypted_session_token"
    t.string "encrypted_session_token_iv"
    t.string "encrypted_session_token_salt"
    t.string "encrypted_username"
    t.string "encrypted_username_iv"
    t.string "encrypted_username_salt"
    t.string "encrypted_password"
    t.string "encrypted_password_iv"
    t.string "encrypted_password_salt"
  end

  create_table "zipped_files", id: :serial, force: :cascade do |t|
    t.integer "loan_application_id"
    t.integer "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.string "encrypted_file_key"
    t.string "encrypted_file_key_iv"
    t.string "encrypted_file_key_salt"
    t.string "file_iv"
    t.string "file_salt"
    t.datetime "deleted_at"
    t.index ["loan_application_id"], name: "index_zipped_files_on_loan_application_id"
    t.index ["token"], name: "index_zipped_files_on_token"
    t.index ["user_id"], name: "index_zipped_files_on_user_id"
  end

  add_foreign_key "documents", "oauth_providers"
  add_foreign_key "memberships", "accounts", on_delete: :restrict
  add_foreign_key "memberships", "users", on_delete: :cascade
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
end
