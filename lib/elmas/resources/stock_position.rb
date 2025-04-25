# frozen_string_literal: true

module Elmas
  # Endpoint
  # StockPosition
  #
  # Good to know
  # Use this endpoint to read stock position.
  # Retrieve item current stock levels and projected stock level with planned movements of stock.
  # For more information about the stock position functionality in Exact Online, see Stock position
  #
  # Scope
  # Logistics inventory
  class StockPosition
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/logistics/StockPosition"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadLogisticsStockPosition
    def other_attributes
      %i[
        free_stock in_stock item_id planning_in planning_out projected_stock reserved_stock
      ]
    end
  end
end
