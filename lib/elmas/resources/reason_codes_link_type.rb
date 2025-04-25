# frozen_string_literal: true

module Elmas
  # Endpoint
  # ReasonCodesLinkType
  #
  # Good to know
  # Use this endpoint to read reason code for logistics type
  #
  # Scope
  # Logistics items
  class ReasonCodesLinkType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/ReasonCodesLinkTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsReasonCodesLinkTypes
    def other_attributes
      %i[
        reason type type_description
      ]
    end
  end
end
