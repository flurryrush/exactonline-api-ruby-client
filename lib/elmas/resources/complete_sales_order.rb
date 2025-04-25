# frozen_string_literal: true

module Elmas
  # Endpoint
  # CompleteSalesOrder
  #
  # Good to know
  # Use this endpoint to complete a sales order either the remaining goods delivery, the outstanding invoice or both.
  #  The sales order will be completed without further goods deliveries, invoice or both.
  # Once completed, this action cannot be undone
  #
  # Scope
  # Sales orders
  class CompleteSalesOrder
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "salesorder/CompleteSalesOrder"
    end

    def mandatory_attributes
      %i[
        order_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderCompleteSalesOrder
    def other_attributes
      %i[
        complete_delivery complete_invoice division error_message success_message
      ]
    end
  end
end
