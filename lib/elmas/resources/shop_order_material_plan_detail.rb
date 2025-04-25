# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrderMaterialPlanDetail
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing shopfloor
  class ShopOrderMaterialPlanDetail
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "manufacturing/ShopOrderMaterialPlanDetails"
    end

    def mandatory_attributes
      %i[
        item shop_order
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingShopOrderMaterialPlanDetails
    def other_attributes
      %i[
        backflush barcode calculator calculator_type created creator creator_full_name
        default_item_storage_location default_item_storage_location_code
        default_item_storage_location_description default_item_storage_location_sequence_number
        description detail_drawing division is_batch is_fraction_allowed_item is_serial
        issued_quantity item_code item_description item_picture_url line_number modified modifier
        modifier_full_name notes planned_amount_fc planned_date planned_in planned_out
        planned_price_fc planned_quantity planned_quantity_factor remaining_quantity
        routing_step_id shop_order_number status status_description stock stock_locations
        sub_shop_order sub_shop_order_number type unit unit_description warehouse waste_percentage
      ]
    end
  end
end
