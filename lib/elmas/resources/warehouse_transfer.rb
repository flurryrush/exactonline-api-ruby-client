# frozen_string_literal: true

module Elmas
  # Endpoint
  # WarehouseTransfer
  #
  # Good to know
  # Use this endpoint to :  Create a new transfer.
  #   Retrieve an existing transfer.
  #   Update the information of an existing draft transfer.
  #   Delete a draft transfer.
  # When both WarehouseFrom and WarehouseTo are the same, this indicate that is a location transfer
  # and StorageLocationFrom and StorageLocationTo should be provided in the WarehouseTransferLines.
  # 
  # For location transfer (Professional & Premium package) or warehouse transfer, 
  # both PlannedDeliveryDate and PlannedReceiptDate are equivalent to PlannedTransferDate.
  # 
  # TransferDate refers to the transfer date of a processed warehouse or location transfer.
  # 
  # You can create the transfer by setting the Status property as below:
  #  â¢ 10 - Open.
  #  This is the default status
  #  â¢ 50 - Complete.
  #  TransferDate property is defaulted according to PlannedDeliveryDate.
  #  
  # If PlannedDeliveryDate does not have a value, EntryDate will be used.
  # For more information about the warehouse or location transfers functionality in Exact Online, see Warehouse transfer
  #
  # Scope
  # Logistics inventory
  class WarehouseTransfer
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/WarehouseTransfers"
    end

    def mandatory_attributes
      %i[
        entry_date warehouse_from warehouse_to warehouse_transfer_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryWarehouseTransfers
    def other_attributes
      %i[
        transfer_id created creator creator_full_name description division modified modifier
        modifier_full_name picked_by planned_delivery_date planned_receipt_date remarks source
        status transfer_date transfer_number transferred_by warehouse_from_code
        warehouse_from_description warehouse_to_code warehouse_to_description
      ]
    end
  end
end
