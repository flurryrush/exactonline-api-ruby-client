# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseOrder
  #
  # Good to know
  # Use this endpoint to :  Create a new purchase order.
  #   Read existing purchase orders.
  #   Update existing purchase orders.
  #   Remove an existing purchase order.
  #  When using the POST method of this endpoint to create a purchase order, it is mandatory to provide a valid supplier and purchase order lines.
  #  The purchase order lines is not necessary when you PUT to this endpoint.
  # For more information about the  functionality in Exact Online, see Overview | Purchase orders
  #
  # Scope
  # Purchase orders
  class PurchaseOrder
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "purchaseorder/PurchaseOrders"
    end

    def mandatory_attributes
      %i[
        purchase_order_lines supplier
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseOrderPurchaseOrders
    def other_attributes
      %i[
        purchase_order_id amount_dc amount_discount amount_discount_excl_vat amount_fc
        amount_fc_excl_vat approval_status approval_status_description approved approver
        approver_full_name created creator creator_full_name currency delivery_account
        delivery_account_code delivery_account_name delivery_address delivery_contact
        delivery_contact_person_full_name description discount division document document_subject
        drop_shipment exchange_rate incoterm_address incoterm_code incoterm_version invoice_status
        modified modifier modifier_full_name order_date order_number order_status payment_condition
        payment_condition_description purchase_agent purchase_agent_full_name
        purchase_order_line_count receipt_date receipt_status remarks sales_order
        sales_order_number selection_code selection_code_code selection_code_description
        shipping_method shipping_method_code shipping_method_description source supplier_code
        supplier_contact supplier_contact_person_full_name supplier_name vat_amount warehouse
        warehouse_code warehouse_description your_ref
      ]
    end
  end
end
