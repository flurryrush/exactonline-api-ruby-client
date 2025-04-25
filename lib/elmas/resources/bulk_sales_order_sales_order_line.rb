# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkSalesOrderSalesOrderLine
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # 
  #
  # Scope
  # Sales orders
  class BulkSalesOrderSalesOrderLine
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/SalesOrder/SalesOrderLines"
    end

    def mandatory_attributes
      %i[
        item order_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkSalesOrderSalesOrderLines
    def other_attributes
      %i[
        amount_dc amount_fc cost_center cost_center_description cost_price_fc cost_unit
        cost_unit_description customer_item_code custom_field delivery_date description discount
        division item_code item_description item_version item_version_description line_number
        net_price notes order_number pricelist pricelist_description project project_description
        purchase_order purchase_order_line purchase_order_line_number purchase_order_number
        quantity shop_order unit_code unit_description unit_price use_drop_shipment vat_amount
        vat_code vat_code_description vat_percentage
      ]
    end
  end
end
