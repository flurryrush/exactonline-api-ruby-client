# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrderMaterialPlan
  #
  # Good to know
  # Use this endpoint to create, read, update and delete materials in a Shop order.
  # You must use previously created Shop order with an item to be produced as a reference to add the materials to.
  # For more information On Shop orders In Exact Online, see Shop order | Create orders for make items
  #
  # Scope
  # Manufacturing shopfloor
  class ShopOrderMaterialPlan
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/ShopOrderMaterialPlans"
    end

    def mandatory_attributes
      %i[
        item shop_order
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingShopOrderMaterialPlans
    def other_attributes
      %i[
        backflush barcode calculator_type created creator creator_full_name description
        detail_drawing division item_code item_description item_picture_url line_number modified
        modifier modifier_full_name notes planned_amount_fc planned_date planned_price_fc
        planned_quantity planned_quantity_factor routing_step_id status status_description type
        unit unit_description waste_percentage
      ]
    end
  end
end
