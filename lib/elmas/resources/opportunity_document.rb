# frozen_string_literal: true

module Elmas
  # Endpoint
  # OpportunityDocument
  #
  # Good to know
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Crm opportunities
  class OpportunityDocument
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/crm/OpportunityDocuments"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadCRMOpportunityDocuments
    def other_attributes
      %i[
        account attachments contact created creator creator_full_name division document_date
        document_folder document_view_url has_empty_body hid modified modifier opportunity
        purchase_invoice_number purchase_order_number sales_invoice_number sales_order_number
        send_method share share_point_connection_status share_point_id source source_description
        subject type type_description
      ]
    end
  end
end
