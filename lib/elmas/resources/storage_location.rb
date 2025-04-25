# frozen_string_literal: true

module Elmas
  # Endpoint
  # StorageLocation
  #
  # Good to know
  # Use this endpoint to read storage locations.
  # Retrieve storage locations linked to warehouse.
  # For more information about the storage locations functionality in Exact Online, see Working with storage locations
  #
  # Scope
  # Logistics inventory
  class StorageLocation
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "inventory/StorageLocations"
    end

    def mandatory_attributes
      %i[
        warehouse
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryStorageLocations
    def other_attributes
      %i[
        code created creator creator_full_name description division main modified modifier
        modifier_full_name pick_sequence warehouse_code warehouse_description
      ]
    end
  end
end
