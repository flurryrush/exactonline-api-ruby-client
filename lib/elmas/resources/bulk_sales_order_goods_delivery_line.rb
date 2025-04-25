# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkSalesOrderGoodsDeliveryLine
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # EntryID, ID, Item
  # 
  #
  # Scope
  # Logistics wms
  class BulkSalesOrderGoodsDeliveryLine
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/SalesOrder/GoodsDeliveryLines"
    end

    def mandatory_attributes
      %i[
        quantity_delivered sales_order_line_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkSalesOrderGoodsDeliveryLines
    def other_attributes
      %i[
        batch_numbers created creator creator_full_name customer_item_code delivery_date
        description division entry_id item item_code item_description line_number modified modifier
        modifier_full_name notes quantity_ordered sales_order_line_number sales_order_number
        serial_numbers storage_location storage_location_code storage_location_description
        tracking_number unitcode
      ]
    end
  end
end
