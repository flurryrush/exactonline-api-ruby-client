# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemWarehouse
  #
  # Good to know
  # Use this endpoint to :  Create a link between an item and a warehouse.
  #   Retrieve an existing linked item warehouse record.
  #   Update item information such as MaximumStock, ReorderPoint, SafetyStock, and more in a warehouse.
  #   Delete the link between an item and a warehouse.
  # This endpoint gives an insight on the current stock levels and look ahead to 
  # the projected stock level with planned movements of stock.
  # An item can be linked to a warehouse to keep inventory organised.
  #  An item can be linked to multiple warehouses.
  #  Storage locations can also 
  # be specified if the warehouse supports storage locations.
  # For more information about the items by warehouses functionality in Exact Online, see Overview: Items by warehouses
  #
  # Scope
  # Logistics inventory
  class ItemWarehouse
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/ItemWarehouses"
    end

    def mandatory_attributes
      %i[
        item warehouse
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryItemWarehouses
    def other_attributes
      %i[
        counting_cycle created creator creator_full_name current_stock default_storage_location
        default_storage_location_code default_storage_location_description division item_barcode
        item_code item_description item_end_date item_is_fraction_allowed_item item_is_stock_item
        item_start_date item_unit item_unit_description maximum_stock modified modifier
        modifier_full_name next_counting_cycle order_policy period planned_stock_in
        planned_stock_out planning_details_url projected_stock reorder_point reorder_quantity
        replenishment_type reserved_stock safety_stock storage_location_sequence_number
        storage_location_url warehouse_code warehouse_description
      ]
    end
  end
end
