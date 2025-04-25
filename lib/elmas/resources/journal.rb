# frozen_string_literal: true

module Elmas
  # Endpoint
  # Journal
  #
  # Good to know
  # Journals are used to create different types of entries in the most efficient way.
  # Use this endpoint to create, update, view or delete journals.
  # Note: Journals can only be deleted if they are not used in entries! Depending on type of journal different fields are relevant for setting up a journal code.
  # Payment service provider types are depending on legislation and package
  #
  # Scope
  # Financial generalledgers
  class Journal
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "financial/Journals"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialJournals
    def other_attributes
      %i[
        allow_variable_currency allow_variable_exchange_rate allow_vat auto_save bank
        bank_account_bic_code bank_account_country bank_account_description bank_account_iban
        bank_account_id bank_account_including_mask bank_account_use_sepa
        bank_account_use_sepa_direct_debit bank_name code created creator creator_full_name
        currency currency_description custom_field description division gl_account gl_account_code
        gl_account_description gl_account_type is_blocked modified modifier modifier_full_name
        payment_in_transit_account payment_service_account_identifier payment_service_provider
        payment_service_provider_name type
      ]
    end
  end
end
