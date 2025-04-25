# frozen_string_literal: true

module Elmas
  # Endpoint
  # FinishAssemblyOrder
  #
  # Good to know
  # Use this endpoint to process assembly order.
  # Finishing assembly orders means that you can receive the assembly order.
  #  When an assembly order is received, the stock of the assembled 
  # item will increase and the stock for the parts it is built from will decrease.
  # When using the BatchNumbers or SerialNumbers, the ParentID property for the part items (StockTransactionType = 165 or StockTransactionType = 166 (disassembly)) must be the same 
  # as the ID property for assembled item (StockTransactionType = 160 or StockTransactionType = 161 (disassembly)).
  # The ID or ParentID for StockBatchNumbers or 
  # StockSerialNumbers will be regenerated during finishing assembly order.
  #  Example of JSON body: 
  #
  # Scope
  # Logistics inventory
  class FinishAssemblyOrder
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "inventory/FinishAssemblyOrder"
    end

    def mandatory_attributes
      %i[
        assembly_order finish_order_quantity
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryFinishAssemblyOrder
    def other_attributes
      %i[
        assembled_item_storage_location assembly_date batch_numbers description division notes
        serial_numbers
      ]
    end
  end
end
