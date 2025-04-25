# frozen_string_literal: true

module Elmas
  # Endpoint
  # OptionalQuotationLineID
  #
  # Good to know
  # Use this endpoint to pass optional quotation line IDs in a POST to AcceptQuotation.
  # Note: It is a sub entity of AcceptQuotation.
  # Quotation lines describe the items that you plan to make it optional in the quotation to your customers
  #
  # Scope
  # Crm quotes
  class OptionalQuotationLineID
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "crm/OptionalQuotationLineID"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMOptionalQuotationLineID
    def other_attributes
      %i[
        
      ]
    end
  end
end
