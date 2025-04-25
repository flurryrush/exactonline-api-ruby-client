# frozen_string_literal: true

module Elmas
  # Endpoint
  # DropShipmentLine
  #
  # Good to know
  # Use this endpoint to :  Create new drop shipment lines.
  #   Read existing drop shipment lines.
  #   Update existing drop shipment lines.
  # Delivery lines support trade-in lines.
  #  For more details, please refer description under properties QuantityDelivered.
  #  Note: DropShipmentLines may not be posted individually.
  #  They should be part of the DropShipments Post.
  #  For creating drop shipment lines, it is mandatory to supply SalesOrderLineID, PurchaseOrderId and QuantityDelivered.
  # For more information about the  functionality in Exact Online, see Drop Shipments - New
  #
  # Scope
  # Logistics wms
  class DropShipmentLine
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "salesorder/DropShipmentLines"
    end

    def mandatory_attributes
      %i[
        purchase_order_line_id quantity_delivered sales_order_line_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderDropShipmentLines
    def other_attributes
      %i[
        batch_numbers created creator creator_full_name customer_item_code delivery_date
        description division entry_id item item_code item_description line_number modified modifier
        modifier_full_name notes quantity_ordered sales_order_line_number sales_order_number
        serial_numbers tracking_number unitcode
      ]
    end
  end
end
