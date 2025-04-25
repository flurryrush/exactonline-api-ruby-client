# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncCRMAccount
  #
  # Good to know
  # The sync api's have the goal to keep the data between Exact Online and a 3rd party application the same.
  # 
  # The sync api's are all based on row versioning and because of that it is guaranteed to be unique.
  #  Every time an existing record is changed or a new record is inserted, the row versioning value is higher than the highest available value at that time.
  #  When retrieving records via these api's also a timestamp value is returned.
  #  The highest timestamp value of the records returned should be stored on client side.
  #  Next time records are retrieved, the timestamp value stored on client side should be provided as parameter.
  #  The api will then return only the new and changed records.
  #  Using this method is more reliable than using modified date, since it can happen that multiple records have the same modified date and therefore same record can be returned more than once.
  #  This will not happen when using timestamp.
  # 
  # The sync api's are also developed to give best performance when retrieving records.
  #  Because of performance and the intended purpose of the api's, only the timestamp field is allowed as parameter.
  # 
  # The single and bulk apiâs are designed for a different purpose.
  #  They provide ability to retrieve specific record or a set of records which meet certain conditions.
  # 
  # In case the division is moved to another database in Exact Online the timestamp values will be reset.
  #  Therefore, after a division is moved all data needs to be synchronized again in order to get the new timestamp values.
  #  To see if a division was moved, the /api/v1/{division}/system/Divisions can be used.
  #  The property DivisionMoveDate indicated at which date a division was moved and this date can be used to determine if it is needed to synchronize all data again.
  # 
  # The API has two important key fields, the Timestamp and the ID.
  #  The ID should be used to uniquely identify the record and will never change
  # .
  #  The Timestamp is used to get new or changed records in an efficient way and will change for every change made to the record.
  # 
  # The timestamp value returned has no relation with actual date or time.
  #  As such it cannot be converted to a date\time value.
  #  The timestamp is a rowversion value.
  # 
  # When you use the sync or delete api for the first time for a particular division, filter on timestamp greater than 1.
  # 
  # 
  #
  # Scope
  # Crm accounts
  class SyncCRMAccount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/CRM/Accounts"
    end

    def mandatory_attributes
      %i[
        name
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncCRMAccounts
    def other_attributes
      %i[
        timestamp accountant account_manager account_manager_full_name account_manager_hid
        activity_sector activity_sub_sector address_line1 address_line2 address_line3
        address_source automatic_process_proposed_entry bank_accounts blocked brin bsn
        business_type can_drop_ship chamber_of_commerce city classification classification1
        classification2 classification3 classification4 classification5 classification6
        classification7 classification8 classification_description code code_at_supplier
        company_size consolidation_scenario controlled_date costcenter costcenter_description
        cost_paid country country_name created creator creator_full_name credit_line_purchase
        credit_line_sales currency customer_since custom_field datev_creditor_code
        datev_debtor_code delivery_advice discount_purchase discount_sales division document
        duns_number email enable_sales_payment_link end_date eori_number established_date fax
        gl_account_purchase gl_account_sales glap glar gln_number has_withholding_tax_sales
        ignore_datev_warning_message incoterm_address_purchase incoterm_address_sales
        incoterm_code_purchase incoterm_code_sales incoterm_version_purchase incoterm_version_sales
        intra_stat_area intra_stat_delivery_term intra_stat_system intra_stat_transaction_a
        intra_stat_transaction_b intra_stat_transport_method invoice_account invoice_account_code
        invoice_account_name invoice_attachment_type invoicing_method is_accountant is_agency
        is_anonymised is_bank is_competitor is_extra_duty is_mailing is_member is_pilot is_purchase
        is_reseller is_sales is_supplier language language_description latitude lead_purpose
        lead_source logo logo_file_name logo_thumbnail_url logo_url longitude main_contact modified
        modifier modifier_full_name oin_number parent pay_as_you_earn payment_condition_purchase
        payment_condition_purchase_description payment_condition_sales
        payment_condition_sales_description peppol_identifier peppol_identifier_type phone
        phone_extension postcode price_list purchase_currency purchase_currency_description
        purchase_lead_days purchase_vat_code purchase_vat_code_description recepient_of_commissions
        remarks reseller reseller_code reseller_name rsin sales_currency sales_currency_description
        sales_tax_schedule sales_tax_schedule_code sales_tax_schedule_description sales_vat_code
        sales_vat_code_description search_code security_level separate_inv_per_project
        separate_inv_per_subscription shipping_lead_days shipping_method show_remark_for_sales
        source start_date state state_name status status_since trade_name type
        unique_taxpayer_reference vat_liability vat_number website
      ]
    end
  end
end
