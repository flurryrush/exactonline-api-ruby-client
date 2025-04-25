# frozen_string_literal: true

module Elmas
  # Endpoint
  # GoodsDelivery
  #
  # Good to know
  # Use this endpoint to :  Create new goods deliveries.
  #   Read existing goods deliveries.
  #   Update existing goods deliveries.
  # Delivery lines support trade-in lines.
  #  For more details, please refer description under properties GoodsDeliveryLines > QuantityDelivered Note: For creating a GoodsDeliveries, it is mandatory to supply one or more GoodsDeliveryLines and DeliveryDate.
  # Business example API goods deliveryFor more information about the  functionality in Exact Online, see Goods delivery - New
  #
  # Scope
  # Logistics wms
  class GoodsDelivery
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "salesorder/GoodsDeliveries"
    end

    def mandatory_attributes
      %i[
        delivery_date goods_delivery_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderGoodsDeliveries
    def other_attributes
      %i[
        entry_id created creator creator_full_name delivery_account delivery_account_code
        delivery_account_name delivery_address delivery_contact delivery_contact_person_full_name
        delivery_number description division document document_subject entry_number modified
        modifier modifier_full_name remarks shipping_method shipping_method_code
        shipping_method_description tracking_number warehouse warehouse_code warehouse_description
      ]
    end
  end
end
