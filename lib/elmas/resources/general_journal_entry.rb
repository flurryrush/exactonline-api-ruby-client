# frozen_string_literal: true

module Elmas
  # Endpoint
  # GeneralJournalEntry
  #
  # Good to know
  # Use this endpoint to create, read or delete general entries not created in bank, cash, purchase or sales journal.
  # Entries created with this service will get type 90 (Other).
  #  It Is Not possible to create entries of type 10 (Opening balance)
  #
  # Scope
  # Financial accounting
  class GeneralJournalEntry
    include Elmas::Resource

    def valid_actions
      %i[get post delete]
    end

    def base_path
      "generaljournalentry/GeneralJournalEntries"
    end

    def mandatory_attributes
      %i[
        general_journal_entry_lines journal_code
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=GeneralJournalEntryGeneralJournalEntries
    def other_attributes
      %i[
        entry_id created currency custom_field division entry_number exchange_rate
        financial_period financial_year journal_description modified reversal status
        status_description type type_description
      ]
    end
  end
end
