# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesOrder
  #
  # Good to know
  # Use this endpoint to create, read, update and delete sales orders.
  # Note: You must include a parameter for 'SalesOrderLines' to add sales order lines when you POST to the SalesOrders endpoint.
  #  This parameter is not necessary when you PUT to this endpoint.
  # It is not recommended to make changes to sales orders after it is completed.
  #  If you use an API command to update a completed sales order, it will not be successful.
  #  However, you can still make changes to it from Exact Online by retrieving the sales order and clicking Edit.
  #  The updated sales order may need to be approved again depending on your settings.
  #  Sales order lines support trade-in lines.
  #  For more details, please refer description under properties SalesOrderLines > QuantitySales orders describe the items that you plan to sell to your customers.
  # For more information about the sales order functionality in Exact Online, see About sales orders.
  # To view an example of the business use of this endpoint, see Rest API - Business example API sales order
  #
  # Scope
  # Sales orders
  class SalesOrder
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesorder/SalesOrders"
    end

    def mandatory_attributes
      %i[
        ordered_by sales_order_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderSalesOrders
    def other_attributes
      %i[
        order_id amount_dc amount_discount amount_discount_excl_vat amount_fc amount_fc_excl_vat
        approval_status approval_status_description approved approver approver_full_name created
        creator creator_full_name currency custom_field deliver_to deliver_to_contact_person
        deliver_to_contact_person_full_name deliver_to_name delivery_address delivery_date
        delivery_status delivery_status_description description discount division document
        document_number document_subject incoterm_address incoterm_code incoterm_version
        invoice_status invoice_status_description invoice_to invoice_to_contact_person
        invoice_to_contact_person_full_name invoice_to_name modified modifier modifier_full_name
        order_date ordered_by_contact_person ordered_by_contact_person_full_name ordered_by_name
        order_number payment_condition payment_condition_description payment_reference remarks
        sales_channel sales_channel_code sales_channel_description sales_order_order_charge_lines
        salesperson salesperson_full_name selection_code selection_code_code
        selection_code_description shipping_method shipping_method_description status
        status_description tax_schedule tax_schedule_code tax_schedule_description warehouse_code
        warehouse_description warehouse_id your_ref
      ]
    end
  end
end
