# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProcessStockCount
  #
  # Good to know
  # Use this endpoint to process existing draft stock count.
  # A stock count is used in the warehouse to record counted quantities.
  # For more information about the stock count functionality in Exact Online, see Stock Count - New
  #
  # Scope
  # Logistics inventory
  class ProcessStockCount
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "inventory/ProcessStockCount"
    end

    def mandatory_attributes
      %i[
        stock_count_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryProcessStockCount
    def other_attributes
      %i[
        division error_message success_message
      ]
    end
  end
end
