# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrderReversal
  #
  # Good to know
  # POSTing a reversal requires an original stock transaction with HasReversibleQuantity=true.
  #  Batch or serial numbers will be reversed automatically using the original stock transaction's data.
  #  This POST will reverse the entire reversible quantity from the original stock transaction.
  #  If a partial reversal has been completed in EOL's UI, this POST will reverse only the remaining quantity.
  # Partial reversal can be done by include quantity in post bodyBatch or serial numbers will be require for serial/batch item when post with partial reversal
  #
  # Scope
  # Manufacturing shopfloor
  class ShopOrderReversal
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "manufacturing/ShopOrderReversals"
    end

    def mandatory_attributes
      %i[
        original_stock_transaction_id transaction_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingShopOrderReversals
    def other_attributes
      %i[
        reversal_stock_transaction_id created_by created_by_full_name created_date is_batch
        is_fraction_allowed_item is_serial item item_code item_description item_picture_url note
        quantity shop_order shop_order_number storage_location storage_location_code
        storage_location_description unit unit_description warehouse warehouse_code
        warehouse_description
      ]
    end
  end
end
