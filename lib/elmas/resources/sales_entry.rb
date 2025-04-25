# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesEntry
  #
  # Good to know
  # Use this endpoint to create, read, update or delete sales entries as financial entries created for your sales invoices.
  # Note: Sales entries are separated to header and line information.
  #  Endpoint SalesEntries is used for the header information.
  #  You must include a parameter for 'SalesEntryLines' to add sales entry lines when you POST to the SalesEntries endpoint.
  #  This parameter is not necessary when you PUT to this endpoint.
  #   The relevance of properties  is very much depending on the legislation and the package used.
  #  
  #
  # Scope
  # Financial accounting
  class SalesEntry
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesentry/SalesEntries"
    end

    def mandatory_attributes
      %i[
        customer journal sales_entry_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesEntrySalesEntries
    def other_attributes
      %i[
        entry_id amount_dc amount_fc batch_number created creator creator_full_name currency
        customer_name custom_field description division document document_number document_subject
        due_date entry_date entry_number external_link_description external_link_reference
        g_account_amount_fc invoice_number is_extra_duty journal_description modified modifier
        modifier_full_name order_number payment_condition payment_condition_description
        payment_condition_payment_method payment_reference process_number rate reporting_period
        reporting_year reversal status status_description type type_description vat_amount_dc
        vat_amount_fc withholding_tax_amount_dc withholding_tax_base_amount
        withholding_tax_percentage your_ref
      ]
    end
  end
end
