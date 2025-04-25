# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemWarehousePlanningDetail
  #
  # Good to know
  # Use this endpoint to read the planning details of an item within a warehouse.
  #  The data returned will display the stock movement 
  # of an item in a warehouse based on different types of stock transaction that are still open.
  # This endpoint will display the general information of a stock transaction that is due to happen.
  #  
  # The movement of stock of a transaction can be traced down to the line number of the respective transaction.
  # For more information about the projected stock functionality in Exact Online, see Projected stock
  #
  # Scope
  # Logistics inventory
  class ItemWarehousePlanningDetail
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "inventory/ItemWarehousePlanningDetails"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryItemWarehousePlanningDetails
    def other_attributes
      %i[
        item item_code item_description planned_date planned_quantity planning_source_description
        planning_source_id planning_source_line_number planning_source_number planning_source_url
        planning_type planning_type_description warehouse warehouse_code warehouse_description
      ]
    end
  end
end
