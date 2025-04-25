# frozen_string_literal: true

module Elmas
  # Endpoint
  # InvoiceSalesOrder
  #
  # Good to know
  # Use this endpoint to invoice sales orders.
  # Note: You must include a parameter for 'SalesOrderID' to add a collection of sales orders IDs to be invoiced.
  #  When you invoice more than one sales order, the maximum total number of sales order lines is 500.
  # The To be invoiced page in Exact Online contains a list of all sales orders for which you need to create invoices.
  # For more information about the Sales order to be invoiced functionality in Exact Online, see About sales orders to be invoiced
  #
  # Scope
  # Sales orders
  class InvoiceSalesOrder
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "salesinvoice/InvoiceSalesOrders"
    end

    def mandatory_attributes
      %i[
        create_mode invoice_mode journal_code sales_order_ids
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoiceInvoiceSalesOrders
    def other_attributes
      %i[
        delivery_number end_date errors number_of_created_invoices number_of_failed_invoices
        start_date user_invoice_date
      ]
    end
  end
end
