# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkSalesInvoiceSalesInvoiceLine
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # 
  #
  # Scope
  # Sales invoices
  class BulkSalesInvoiceSalesInvoiceLine
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/SalesInvoice/SalesInvoiceLines"
    end

    def mandatory_attributes
      %i[
        gl_account invoice_id item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkSalesInvoiceSalesInvoiceLines
    def other_attributes
      %i[
        amount_dc amount_fc cost_center cost_center_description cost_unit cost_unit_description
        customer_item_code custom_field delivery_date description discount division employee
        employee_full_name end_time extra_duty_amount_fc extra_duty_percentage
        gl_account_description item_code item_description line_number net_price notes pricelist
        pricelist_description project project_description project_wbs project_wbs_description
        quantity sales_order sales_order_line sales_order_line_number sales_order_number start_time
        subscription subscription_description tax_schedule tax_schedule_code
        tax_schedule_description unit_code unit_description unit_price vat_amount_dc vat_amount_fc
        vat_code vat_code_description vat_percentage
      ]
    end
  end
end
