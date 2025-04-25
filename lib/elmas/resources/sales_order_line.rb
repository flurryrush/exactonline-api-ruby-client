# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesOrderLine
  #
  # Good to know
  # Use this endpoint to create, read, update and delete sales order lines.
  # Sales order lines support trade-in lines.
  #  For more details, please refer description under properties QuantitySales orders describe the items that you plan to sell to your customers.
  # For more information about the sales order functionality in Exact Online, see About sales orders.
  # To view an example of the business use of this endpoint, see Rest API - Business example API sales order
  #
  # Scope
  # Sales orders
  class SalesOrderLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesorder/SalesOrderLines"
    end

    def mandatory_attributes
      %i[
        item order_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderSalesOrderLines
    def other_attributes
      %i[
        amount_dc amount_fc cost_center cost_center_description cost_price_fc cost_unit
        cost_unit_description customer_item_code custom_field delivery_date delivery_status
        description discount division invoice_status item_code item_description item_version
        item_version_description line_number margin net_price notes order_number order_status
        pricelist pricelist_description project project_description purchase_order
        purchase_order_line purchase_order_line_number purchase_order_number quantity
        quantity_delivered quantity_invoiced shop_order tax_schedule tax_schedule_code
        tax_schedule_description unit_code unit_description unit_price use_drop_shipment vat_amount
        vat_code vat_code_description vat_percentage
      ]
    end
  end
end
