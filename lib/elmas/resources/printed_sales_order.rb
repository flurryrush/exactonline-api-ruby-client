# frozen_string_literal: true

module Elmas
  # Endpoint
  # PrintedSalesOrder
  #
  # Good to know
  # Use this endpoint to print or send a sales order document.
  # The document is created through the given 'OrderId', and is sent to the respective receiver based on the given 'SendEmailToCustomer' and 'SenderEmailAddress'.
  # An existing sales order entry must be located to create a sales order document.
  #  When you have created a sales order, you can print it for internal use or to send it to a customer.
  #  You cannot print sales orders that have been cancelled.
  # For more information about the sales order functionality in Exact Online, see Print sales orders.
  # To view an example of the business use of this endpoint, see Rest API - Business example API sales order
  #
  # Scope
  # Sales orders
  class PrintedSalesOrder
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "salesorder/PrintedSalesOrders"
    end

    def mandatory_attributes
      %i[
        order_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderPrintedSalesOrders
    def other_attributes
      %i[
        division document document_creation_error document_creation_success document_layout
        email_creation_error email_creation_success email_layout extra_text send_email_to_customer
        sender_email_address
      ]
    end
  end
end
