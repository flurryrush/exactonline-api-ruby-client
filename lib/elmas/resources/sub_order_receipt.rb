# frozen_string_literal: true

module Elmas
  # Endpoint
  # SubOrderReceipt
  #
  # Good to know
  # Prior to POSTing to this endpoint, if Item.
  # IsBatchItem=1 or Item.
  # IsSerialItem=1, then the batch or serial numbers must be reserved using the StockBatchNumbers or StockSerialNumbers endpoint respectively.
  #  Use StockTransactionType of '140' when reserving these batch or serial numbers
  #
  # Scope
  # Manufacturing production
  class SubOrderReceipt
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "manufacturing/SubOrderReceipts"
    end

    def mandatory_attributes
      %i[
        quantity sub_shop_order transaction_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingSubOrderReceipts
    def other_attributes
      %i[
        shop_order_receipt_stock_transaction_id created_by created_by_full_name created_date
        draft_stock_transaction_id has_reversible_quantity is_batch is_fraction_allowed_item
        is_serial item item_code item_description item_picture_url
        material_issue_stock_transaction_id parent_shop_order parent_shop_order_material_plan
        parent_shop_order_number sub_shop_order_number unit unit_description warehouse
        warehouse_code warehouse_description
      ]
    end
  end
end
