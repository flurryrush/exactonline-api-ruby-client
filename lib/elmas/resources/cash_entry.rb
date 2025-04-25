# frozen_string_literal: true

module Elmas
  # Endpoint
  # CashEntry
  #
  # Good to know
  # Use this endpoint to create, delete or read cash entries.
  # Note: Cash entries are separated to header and line information.
  #  Endpoint CashEntries is used for the header information.
  #  You must include a parameter for 'CashEntryLines' to add cash entry lines when you POST to the CashEntries endpoint.
  # Cash entries have an opening balance which should be the end balance of the previous entry.
  #  Opening balance plus all cash entry lines should result in the closing balance
  #
  # Scope
  # Financial accounting
  class CashEntry
    include Elmas::Resource

    def valid_actions
      %i[get post delete]
    end

    def base_path
      "financialtransaction/CashEntries"
    end

    def mandatory_attributes
      %i[
        cash_entry_lines journal_code
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialTransactionCashEntries
    def other_attributes
      %i[
        entry_id closing_balance_fc created currency custom_field division entry_number
        financial_period financial_year journal_description modified opening_balance_fc status
        status_description
      ]
    end
  end
end
