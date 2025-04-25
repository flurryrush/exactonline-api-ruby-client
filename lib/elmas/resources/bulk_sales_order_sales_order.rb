# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkSalesOrderSalesOrder
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # 
  #
  # Scope
  # Sales orders
  class BulkSalesOrderSalesOrder
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/SalesOrder/SalesOrders"
    end

    def mandatory_attributes
      %i[
        ordered_by sales_order_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkSalesOrderSalesOrders
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
        sales_channel sales_channel_code sales_channel_description salesperson
        salesperson_full_name selection_code selection_code_code selection_code_description
        shipping_method shipping_method_description status status_description tax_schedule
        tax_schedule_code tax_schedule_description warehouse_code warehouse_description
        warehouse_id your_ref
      ]
    end
  end
end
