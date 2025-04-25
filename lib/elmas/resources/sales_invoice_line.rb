# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesInvoiceLine
  #
  # Good to know
  # Use this endpoint to create, read, update and delete sales invoice lines.
  # Sales invoice describe the items that you sell to your customers.
  # For more information about the sales invoice functionality in Exact Online, see About sales invoices.
  # To view an example of the business use of this endpoint, see Rest API - Business example API sales invoice
  #
  # Scope
  # Sales invoices
  class SalesInvoiceLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesinvoice/SalesInvoiceLines"
    end

    def mandatory_attributes
      %i[
        gl_account invoice_id item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoiceSalesInvoiceLines
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
