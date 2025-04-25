# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseEntry
  #
  # Good to know
  # Use this endpoint to create, read, update or delete purchase entries as financial entries created for your purchase invoices.
  # Note: Purchase entries are separated to header and line information.
  #  Endpoint PurchaseEntries is used for the header information.
  #  You must include a parameter for 'PurchaseEntryLines' to add purchase entry lines when you POST to the PurchaseEntries endpoint.
  #  This parameter is not necessary when you PUT to this endpoint.
  # The relevance of properties is very much depending on the legislation and the package used.
  # For optimal performance, refer 'Example usage' below to call our API
  #
  # Scope
  # Financial accounting
  class PurchaseEntry
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "purchaseentry/PurchaseEntries"
    end

    def mandatory_attributes
      %i[
        journal purchase_entry_lines supplier
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseEntryPurchaseEntries
    def other_attributes
      %i[
        entry_id amount_dc amount_fc batch_number created creator creator_full_name currency
        custom_field description division document document_number document_subject due_date
        entry_date entry_number external_link_description external_link_reference
        g_account_amount_fc invoice_number journal_description modified modifier modifier_full_name
        order_number payment_condition payment_condition_description
        payment_condition_payment_method payment_reference process_number rate reporting_period
        reporting_year reversal status status_description supplier_name type type_description
        vat_amount_dc vat_amount_fc your_ref
      ]
    end
  end
end
