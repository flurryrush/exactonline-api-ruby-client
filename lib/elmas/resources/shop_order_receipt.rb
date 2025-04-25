# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrderReceipt
  #
  # Good to know
  # Prior to POSTing to this endpoint, if Item.
  # IsBatchItem=1 or Item.
  # IsSerialItem=1, then the batch or serial numbers must be reserved using the StockBatchNumbers or StockSerialNumbers endpoint respectively.
  #  Use StockTransactionType of '140' when reserving these batch or serial numbers
  #
  # Scope
  # Manufacturing shopfloor
  class ShopOrderReceipt
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "manufacturing/ShopOrderReceipts"
    end

    def mandatory_attributes
      %i[
        quantity shop_order transaction_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingShopOrderReceipts
    def other_attributes
      %i[
        stock_transaction_id created_by created_by_full_name created_date division
        draft_stock_transaction_id has_reversible_quantity is_batch is_fraction_allowed_item
        is_issue_to_parent is_serial item item_code item_description item_picture_url
        parent_shop_order parent_shop_order_number receipt_number related_stock_transaction
        shop_order_number storage_location storage_location_code storage_location_description unit
        unit_description warehouse warehouse_code warehouse_description
      ]
    end
  end
end
