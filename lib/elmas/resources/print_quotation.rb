# frozen_string_literal: true

module Elmas
  # Endpoint
  # PrintQuotation
  #
  # Good to know
  # With this endpoint a document with an attachment containing the printed quotation is created.
  #  You can also send the quotation directly to the customer by email.
  #  'Printing' a quotation is required before it can be accepted, rejected or reviewed
  #
  # Scope
  # Crm quotes
  class PrintQuotation
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "crm/PrintQuotation"
    end

    def mandatory_attributes
      %i[
        quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMPrintQuotation
    def other_attributes
      %i[
        division document document_creation_error document_creation_success document_layout
        email_creation_error email_layout extra_text quotation_date send_email_to_customer
        sender_email_address
      ]
    end
  end
end
