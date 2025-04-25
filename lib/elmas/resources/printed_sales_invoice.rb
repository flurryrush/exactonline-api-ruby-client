# frozen_string_literal: true

module Elmas
  # Endpoint
  # PrintedSalesInvoice
  #
  # Good to know
  # Use this endpoint to print or send a sales invoice document.
  # The document is created through the given 'InvoiceID', and is sent to the respective receiver based on the given 'SendEmailToCustomer', 'SenderEmailAddress', 'SendInvoiceToCustomerPostbox' , 'SendInvoiceViaPeppol' and 'SendOutputBasedOnAccount'.
  # An existing sales invoice entry must be located to create a sales invoice document.
  #  When you create sales invoices, you can print them for internal use or send them to your customers.
  # For more information about the sales invoice functionality in Exact Online, see Print sales invoices.
  # To view an example of the business use of this endpoint, see Rest API - Business example API sales invoice
  #
  # Scope
  # Sales invoices
  class PrintedSalesInvoice
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "salesinvoice/PrintedSalesInvoices"
    end

    def mandatory_attributes
      %i[
        invoice_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoicePrintedSalesInvoices
    def other_attributes
      %i[
        division document document_creation_error document_creation_success document_layout
        email_creation_error email_creation_success email_layout extra_text invoice_date
        peppol_creation_error peppol_creation_success postbox_message_creation_error
        postbox_message_creation_success postbox_sender reporting_period reporting_year
        send_email_to_customer sender_email_address send_invoice_to_customer_postbox
        send_invoice_via_peppol send_output_based_on_account
      ]
    end
  end
end
