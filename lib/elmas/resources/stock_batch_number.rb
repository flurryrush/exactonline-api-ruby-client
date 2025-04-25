# frozen_string_literal: true

module Elmas
  # Endpoint
  # StockBatchNumber
  #
  # Good to know
  # Use this endpoint to :  Create a draft stock transaction for a batch number.
  #   Retrieve an existing stock transaction for a batch number.
  #   Update the quantity of the draft stock transaction for a batch number.
  #   Delete the draft stock transaction for a batch number.
  # Note:   In order to POST the following StockTransactionType [140, 141, 147, 148, 150, 151], it is required to have a Manufacturing solution.
  #   Draft stock transaction for batch number is not supported for StockTransactionType [124, 125].
  #   The batch number of part item (StockTransactionType = 165 or StockTransactionType = 166) can be linked via POST using the 
  # ParentID property which is the same as the ID property for assembled item (StockTransactionType = 160 or StockTransactionType = 161).
  #   The DraftStockTransactionID must be the same if multiple batch number is used for one pick order line.
  #   Example of JSON body: When linking a batch number to a stock count line via POST:You can either create a new batch number for incoming quantity, or link an existing batch number for outgoing/incoming quantity.
  #   StockCountLine is mandatory.
  #   StockTransactionType should be Stock Count which is 195.
  #   If StorageLocation is provided, this value will be validated.
  #  If StorageLocation is not provided, then the value for this field will be taken from StockCountLine.
  #   The sign of Quantity stored will be set to be the same as the sign of quantity difference of the StockCountLine.
  #   The DraftStockTransactionID provided should be the same as the DraftStockTransactionID of
  # another existing stock batch number record linked to the particular StockCountLine.
  # When updating the quantity via PUT:  Quantity update is only supported for Stock count (StockTransactionType [195]) which is in draft.
  #   The sign of Quantity stored will be set to be the same as the sign of quantity difference of the StockCountLine.
  # This endpoint describes the in or out movement of the batch item stock in a warehouse or storage location.
  # For more information about the batch numbers functionality in Exact Online, see About serial and batch numbers
  #
  # Scope
  # Logistics inventory sales orders purchase orders
  class StockBatchNumber
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/StockBatchNumbers"
    end

    def mandatory_attributes
      %i[
        batch_number draft_stock_transaction_id quantity stock_transaction_type warehouse
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryStockBatchNumbers
    def other_attributes
      %i[
        batch_number_id created creator creator_full_name division end_date is_blocked is_draft
        item item_code item_description modified modifier modifier_full_name parent_id
        pick_order_line remarks sales_order_line sales_return_line stock_count_line
        stock_transaction_id storage_location storage_location_code storage_location_description
        warehouse_code warehouse_description warehouse_transfer_line
      ]
    end
  end
end
