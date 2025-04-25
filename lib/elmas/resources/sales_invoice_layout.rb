# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesInvoiceLayout
  #
  # Good to know
  # Use this endpoint to read sales invoice layouts.
  # Sales invoice layout retrieved can be used in 'PrintedSalesInvoice' endpoint
  #
  # Scope
  # Sales invoices
  class SalesInvoiceLayout
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "salesinvoice/Layouts"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoiceLayouts
    def other_attributes
      %i[
        created creator creator_full_name division modified modifier modifier_full_name subject
        type
      ]
    end
  end
end
