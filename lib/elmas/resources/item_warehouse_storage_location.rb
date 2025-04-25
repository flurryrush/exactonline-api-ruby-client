# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemWarehouseStorageLocation
  #
  # Good to know
  # Use this endpoint to read the general information of a specified item and the respective warehouse(s) and storage location(s).
  # A warehouse is a physical site (address) that includes one or more storage locations where all logistic handling
  # of goods take place.
  #  Storage locations are containers in the warehouse that hold stock and are used to optimise stock
  # handling throughout a warehouse.
  # For more information about the management of item storage at different physical locations functionality in Exact Online, see Introducing Multi warehousing
  #
  # Scope
  # Logistics inventory
  class ItemWarehouseStorageLocation
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "inventory/ItemWarehouseStorageLocations"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryItemWarehouseStorageLocations
    def other_attributes
      %i[
        is_fraction_allowed_item is_stock_item item item_barcode item_code item_description
        item_end_date item_start_date item_unit item_unit_description stock storage_location
        storage_location_code storage_location_description storage_location_sequence_number
        warehouse warehouse_code warehouse_description
      ]
    end
  end
end
