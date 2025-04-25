# frozen_string_literal: true

module Elmas
  # Endpoint
  # MaterialIssue
  #
  # Good to know
  # Prior to POSTing to this endpoint, if Item.
  # IsBatchItem=1 or Item.
  # IsSerialItem=1, then the batch or serial numbers must be reserved using the StockBatchNumbers or StockSerialNumbers endpoint respectively.
  #  Use StockTransactionType of '150' when reserving these batch or serial numbers
  #
  # Scope
  # Manufacturing production
  class MaterialIssue
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "manufacturing/MaterialIssues"
    end

    def mandatory_attributes
      %i[
        quantity shop_order_material_plan transaction_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingMaterialIssues
    def other_attributes
      %i[
        stock_transaction_id created_by created_by_full_name created_date
        draft_stock_transaction_id has_reversible_quantity is_backflush is_batch
        is_fraction_allowed_item is_issue_from_child is_serial item item_code item_description
        item_picture_url note related_stock_transaction shop_order shop_order_number
        storage_location storage_location_code storage_location_description unit unit_description
        warehouse warehouse_code warehouse_description
      ]
    end
  end
end
