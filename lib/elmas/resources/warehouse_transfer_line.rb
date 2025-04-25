# frozen_string_literal: true

module Elmas
  # Endpoint
  # WarehouseTransferLine
  #
  # Good to know
  # Use this endpoint to :  Create a new line for an item that is already existing in a draft transfer.
  #   Retrieve an existing transfer line.
  #   Update the line information of an existing draft transfer.
  #   Delete a line from a draft transfer.
  # For more information about the warehouse or location transfer lines functionality in Exact Online, see Warehouse transfer
  #
  # Scope
  # Logistics inventory
  class WarehouseTransferLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/WarehouseTransferLines"
    end

    def mandatory_attributes
      %i[
        item quantity transfer_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryWarehouseTransferLines
    def other_attributes
      %i[
        batch_numbers created creator creator_full_name description division item_code
        item_description line_number modified modifier modifier_full_name picked_by serial_numbers
        storage_location_from storage_location_from_code storage_location_from_description
        storage_location_from_location_sequence storage_location_to storage_location_to_code
        storage_location_to_description storage_location_to_location_sequence transferred_by
        unit_code unit_description
      ]
    end
  end
end
