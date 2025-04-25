# frozen_string_literal: true

module Elmas
  # Endpoint
  # TransactionLine
  #
  # Good to know
  # Use this endpoint to read all kind of transactions created in Exact.
  #   Find more details on the attributes in the relevant topic description for BankEntries, CashEntries, GeneralJournalEntries, PurchaseEntries or SalesEntries
  #
  # Scope
  # Financial accounting
  class TransactionLine
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financialtransaction/TransactionLines"
    end

    def mandatory_attributes
      %i[
        entry_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialTransactionTransactionLines
    def other_attributes
      %i[
        account account_code account_name amount_dc amount_fc amount_vat_base_fc amount_vatfc
        asset asset_code asset_description cost_center cost_center_description cost_unit
        cost_unit_description created creator creator_full_name currency custom_field date
        description division document document_number document_subject due_date entry_number
        exchange_rate external_link_description external_link_reference extra_duty_amount_fc
        extra_duty_percentage financial_period financial_year gl_account gl_account_code
        gl_account_description invoice_number item item_code item_description journal_code
        journal_description line_number line_type modified modifier modifier_full_name notes
        offset_id order_number payment_discount_amount payment_reference project project_code
        project_description project_wbs project_wbs_description quantity serial_number shop_order
        status subscription subscription_description tracking_number tracking_number_description
        type vat_code vat_code_description vat_percentage vat_type your_ref
      ]
    end
  end
end
