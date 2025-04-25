# frozen_string_literal: true

module Elmas
  # Endpoint
  # GoodsDeliveryLine
  #
  # Good to know
  # Use this endpoint to :  Create new goods delivery lines.
  #   Read existing goods delivery lines.
  #   Update existing goods delivery lines.
  # Delivery lines support trade-in lines.
  #  For more details, please refer description under properties QuantityDelivered.
  #  Note: GoodsDeliveryLines may not be posted individually.
  #  They should be part of the GoodsDeliveries Post.
  #  For creating goods delivery lines, it is mandatory to supply SalesOrderLineID and QuantityDelivered.
  # Business example API goods deliveryFor more information about the  functionality in Exact Online, see Goods delivery - New
  #
  # Scope
  # Logistics wms
  class GoodsDeliveryLine
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "salesorder/GoodsDeliveryLines"
    end

    def mandatory_attributes
      %i[
        quantity_delivered sales_order_line_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderGoodsDeliveryLines
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
