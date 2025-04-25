# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesOrderID
  #
  # Good to know
  # Use this endpoint to pass sales order IDs in a POST to InvoiceSalesOrders.
  # Note: It is a sub entity of InvoiceSalesOrders.
  # Sales orders describe the items that you plan to sell to your customers.
  # For more information about the sales orders functionality in Exact Online, see About sales orders
  #
  # Scope
  # Sales orders
  class SalesOrderID
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "salesinvoice/SalesOrderID"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoiceSalesOrderID
    def other_attributes
      %i[
        
      ]
    end
  end
end
