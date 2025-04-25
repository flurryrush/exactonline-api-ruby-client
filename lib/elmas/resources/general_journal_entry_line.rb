# frozen_string_literal: true

module Elmas
  # Endpoint
  # GeneralJournalEntryLine
  #
  # Good to know
  # Use this endpoint to create and read general entries not created in bank, cash, purchase or sales journal.
  #   Journals for general journal entries can be set up with and without VAT functionality (VAT checkbox in Journals).
  #  Specifying any VAT related property in a POST request is only useful if supported by the general journal of the entry
  #
  # Scope
  # Financial accounting
  class GeneralJournalEntryLine
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "generaljournalentry/GeneralJournalEntryLines"
    end

    def mandatory_attributes
      %i[
        entry_id gl_account
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=GeneralJournalEntryGeneralJournalEntryLines
    def other_attributes
      %i[
        account account_code account_name amount_dc amount_fc amount_vatdc amount_vatfc asset
        asset_code asset_description cost_center cost_center_description cost_unit
        cost_unit_description created creator creator_full_name custom_field date description
        division document document_number document_subject entry_number gl_account_code
        gl_account_description line_number modified modifier modifier_full_name notes offset_id
        our_ref project project_code project_description project_wbs project_wbs_description
        quantity vat_base_amount_dc vat_base_amount_fc vat_code vat_code_description vat_percentage
        vat_type
      ]
    end
  end
end
