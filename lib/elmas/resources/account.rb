# frozen_string_literal: true

module Elmas
  # Endpoint
  # Account
  #
  # Good to know
  # 
  #
  # Scope
  # Crm accounts
  class Account
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "crm/Accounts"
    end

    def mandatory_attributes
      %i[
        name
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAccounts
    def other_attributes
      %i[
        accountant account_manager account_manager_full_name account_manager_hid activity_sector
        activity_sub_sector address_line1 address_line2 address_line3 address_source
        automatic_process_proposed_entry bank_accounts blocked brin bsn business_type can_drop_ship
        chamber_of_commerce city classification classification1 classification2 classification3
        classification4 classification5 classification6 classification7 classification8
        classification_description code code_at_supplier company_size consolidation_scenario
        controlled_date costcenter costcenter_description cost_paid country country_name created
        creator creator_full_name credit_line_purchase credit_line_sales currency customer_since
        custom_field datev_creditor_code datev_debtor_code delivery_advice discount_purchase
        discount_sales division document duns_number email enable_sales_payment_link end_date
        eori_number established_date fax gl_account_purchase gl_account_sales glap glar gln_number
        has_withholding_tax_sales ignore_datev_warning_message incoterm_address_purchase
        incoterm_address_sales incoterm_code_purchase incoterm_code_sales incoterm_version_purchase
        incoterm_version_sales intra_stat_area intra_stat_delivery_term intra_stat_system
        intra_stat_transaction_a intra_stat_transaction_b intra_stat_transport_method
        invoice_account invoice_account_code invoice_account_name invoice_attachment_type
        invoicing_method is_accountant is_agency is_anonymised is_bank is_competitor is_extra_duty
        is_mailing is_member is_pilot is_purchase is_reseller is_sales is_supplier language
        language_description latitude lead_purpose lead_source logo logo_file_name
        logo_thumbnail_url logo_url longitude main_contact modified modifier modifier_full_name
        oin_number parent pay_as_you_earn payment_condition_purchase
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
