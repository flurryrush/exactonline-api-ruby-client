# frozen_string_literal: true

module Elmas
  # Endpoint
  # Warehouse
  #
  # Good to know
  # Use this endpoint to create, read, update and delete warehouses.
  # You can assign items to your warehouses.
  # For more information about the warehouses functionality in Exact Online, see Working with warehouses
  #
  # Scope
  # Logistics inventory
  class Warehouse
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/Warehouses"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryWarehouses
    def other_attributes
      %i[
        code created creator creator_full_name default_storage_location
        default_storage_location_code default_storage_location_description description division
        e_mail main manager_user modified modifier modifier_full_name use_storage_locations
      ]
    end
  end
end
