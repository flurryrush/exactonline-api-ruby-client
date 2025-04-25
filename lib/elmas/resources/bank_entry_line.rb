# frozen_string_literal: true

module Elmas
  # Endpoint
  # BankEntryLine
  #
  # Good to know
  # Use this endpoint to create or read bank entry lines for the bank statements received.
  # Note: Bank entries are separated to header and line information.
  #  Endpoint BankEntryLines is used for the line information
  #
  # Scope
  # Financial accounting
  class BankEntryLine
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "financialtransaction/BankEntryLines"
    end

    def mandatory_attributes
      %i[
        amount_fc entry_id gl_account
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialTransactionBankEntryLines
    def other_attributes
      %i[
        account account_code account_name amount_dc amount_vatfc asset asset_code
        asset_description cost_center cost_center_description cost_unit cost_unit_description
        created creator creator_full_name custom_field date description division document
        document_number document_subject entry_number exchange_rate gl_account_code
        gl_account_description line_number modified modifier modifier_full_name notes offset_id
        our_ref project project_code project_description project_wbs project_wbs_description
        quantity vat_code vat_code_description vat_percentage vat_type
      ]
    end
  end
end
