# frozen_string_literal: true

module Elmas
  # Endpoint
  # CompleteSalesOrderLine
  #
  # Good to know
  # Use this endpoint to :  Complete a sales order line for - Goods delivery and/or 
  # - Sales invoice
  # You can no longer perform the remaining delivery and invoice the outstanding amount for the sales order line.
  # Once completed, this action cannot be undone.
  # 
  # 
  #
  # Scope
  # Sales orders
  class CompleteSalesOrderLine
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "salesorder/CompleteSalesOrderLine"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderCompleteSalesOrderLine
    def other_attributes
      %i[
        complete_delivery complete_invoice division error_message success_message
      ]
    end
  end
end
