# frozen_string_literal: true

module Elmas
  # Endpoint
  # StockSerialNumber
  #
  # Good to know
  # Use this endpoint to create, read and delete stock transaction for serial items.
  #  This endpoint is best used with other endpoints such as StockCountLines, 
  # GoodsDeliveryLines, GoodsReceiptLines and etc.
  # Note:   In order to POST the following StockTransactionType [140, 141, 147, 148, 150, 151], 
  # it is required to have Manufacturing solution.
  #   Draft stock transaction for serial number is not supported for StockTransactionType [124, 125].
  #   The serial number of part item (StockTransactionType = 165 or StockTransactionType = 166) can be linked via POST using the 
  # ParentID property which is the same as the ID property for assembled item (StockTransactionType = 160 or StockTransactionType = 161).
  #   The DraftStockTransactionID must be the same if multiple serial number is used for one pick order line.
  #   Example of JSON body: This endpoint describes the in or out movement of the serial item stock in a warehouse or storage location.
  # For more information about the serial numbers functionality in Exact Online, see About serial and batch numbers
  #
  # Scope
  # Logistics inventory sales orders purchase orders
  class StockSerialNumber
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/StockSerialNumbers"
    end

    def mandatory_attributes
      %i[
        draft_stock_transaction_id serial_number stock_transaction_type warehouse
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryStockSerialNumbers
    def other_attributes
      %i[
        created creator creator_full_name division end_date is_blocked is_draft item item_code
        item_description modified modifier modifier_full_name parent_id pick_order_line remarks
        sales_order_line sales_return_line serial_number_id start_date stock_count_line
        stock_transaction_id storage_location storage_location_code storage_location_description
        warehouse_code warehouse_description warehouse_transfer_line
      ]
    end
  end
end
