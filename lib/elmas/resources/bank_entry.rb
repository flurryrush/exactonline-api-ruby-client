# frozen_string_literal: true

module Elmas
  # Endpoint
  # BankEntry
  #
  # Good to know
  # Use this endpoint to create, delete or read bank entries for the bank statements received.
  #  Note: Bank entries are separated to header and line information.
  #  Endpoint BankEntries is used for the header information.
  #  You must include a parameter for 'BankEntryLines' to add cash entry lines when you POST to the BankEntries endpoint.
  # Bank entries have an opening balance which should be the end balance of the previous entry.
  #  Opening balance plus all bank entry lines should result in the closing balance
  #
  # Scope
  # Financial accounting
  class BankEntry
    include Elmas::Resource

    def valid_actions
      %i[get post delete]
    end

    def base_path
      "financialtransaction/BankEntries"
    end

    def mandatory_attributes
      %i[
        bank_entry_lines journal_code
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialTransactionBankEntries
    def other_attributes
      %i[
        entry_id bank_statement_document bank_statement_document_number
        bank_statement_document_subject closing_balance_fc created currency custom_field division
        entry_number financial_period financial_year journal_description modified
        opening_balance_fc status status_description
      ]
    end
  end
end
