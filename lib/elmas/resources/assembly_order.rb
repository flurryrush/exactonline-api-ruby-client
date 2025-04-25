# frozen_string_literal: true

module Elmas
  # Endpoint
  # AssemblyOrder
  #
  # Good to know
  # Use this endpoint to read assembly order.
  # Assembly orders allow you to create assembled items and keep them in stock.
  #  The assembled item has a bill of material of one 
  # or more parts.
  #  When you create an assembly order, the stock position of the parts will be adjusted as Planned out and the 
  # assembled item will be Planned in stock.
  # For more information about the assembly order functionality in Exact Online, see Introducing Assembly orders
  #
  # Scope
  # Manufacturing production
  class AssemblyOrder
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "inventory/AssemblyOrders"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryAssemblyOrders
    def other_attributes
      %i[
        assembly_date description division finished_assembly_date finished_quantity item item_code
        item_description notes order_date order_number order_status part_items planned_quantity
        storage_location storage_location_code storage_location_description
        storage_location_sequence_number type unit unit_code unit_description warehouse
        warehouse_code warehouse_description
      ]
    end
  end
end
