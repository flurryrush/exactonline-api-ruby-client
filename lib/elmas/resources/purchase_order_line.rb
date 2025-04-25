# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseOrderLine
  #
  # Good to know
  # Use this endpoint to :  Create a new purchase order line.
  #   Read existing purchase order lines.
  #   Update an existing purchase order line  Remove an existing purchase order line.
  #  Purchase order lines may not be posted individually.
  #  They should be part of the PurchaseOrder Post.
  #  When using the POST method of this endpoint to create a purchase order line it is mandatory to provide an Item and Quantity.
  #  When deleting a purchase order line, a purchase order must have at least one line.
  #  If necessary delete the complete purchase order.
  # For more information about the  functionality in Exact Online, see Overview | Purchase orders
  #
  # Scope
  # Purchase orders
  class PurchaseOrderLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "purchaseorder/PurchaseOrderLines"
    end

    def mandatory_attributes
      %i[
        item purchase_order_id quantity_in_purchase_units
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseOrderPurchaseOrderLines
    def other_attributes
      %i[
        amount_dc amount_fc cost_center cost_center_description cost_unit cost_unit_description
        created creator creator_full_name custom_field description discount division expense
        expense_description in_stock invoiced_quantity is_batch_number_item is_serial_number_item
        item_barcode item_barcode_additional item_code item_description item_divisable line_number
        modified modifier modifier_full_name net_price notes project project_code
        project_description projected_stock quantity rebill receipt_date received_quantity
        sales_order sales_order_line sales_order_line_number sales_order_number shop_order
        shop_order_material_plan shop_order_material_plan_line_number shop_order_material_plans
        shop_order_number shop_order_routing_step_plan shop_order_routing_step_plan_line_number
        shop_order_routing_step_plans supplier_item_code supplier_item_copy_remarks unit
        unit_description unit_price vat_amount vat_code vat_description vat_percentage
      ]
    end
  end
end
