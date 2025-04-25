# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrder
  #
  # Good to know
  # Use this endpoint to create, read, update and delete Shop orders.
  # For more information on the Shop order functionality in Exact Online, see Shop order | Create orders for make items
  #
  # Scope
  # Manufacturing shopfloor
  class ShopOrder
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/ShopOrders"
    end

    def mandatory_attributes
      %i[
        item planned_quantity
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingShopOrders
    def other_attributes
      %i[
        cad_drawing_url costcenter costcenter_description costunit costunit_description created
        creator creator_full_name description division entry_date is_batch is_fraction_allowed_item
        is_in_planning is_on_hold is_released is_serial item_barcode item_code item_description
        item_picture_url item_version item_version_description modified modifier modifier_full_name
        notes planned_date planned_start_date produced_quantity production_lead_days project
        project_description ready_to_ship_quantity sales_order_line_count sales_order_lines
        selection_code selection_code_code selection_code_description
        shop_order_by_product_plan_backflush_count shop_order_by_product_plan_count shop_order_main
        shop_order_main_number shop_order_material_plan_backflush_count
        shop_order_material_plan_count shop_order_material_plans
        shop_order_material_plans_non_issued_byproducts_count
        shop_order_material_plans_non_issued_materials_count shop_order_number
        shop_order_number_string shop_order_parent shop_order_parent_number
        shop_order_routing_step_plan_count shop_order_routing_step_plans status
        sub_shop_order_count type unit unit_description warehouse warehouse_code
        warehouse_description your_ref
      ]
    end
  end
end
