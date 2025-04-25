# frozen_string_literal: true

module Elmas
  # Endpoint
  # LogisticsReasonCode
  #
  # Good to know
  # Use this endpoint to read reason code for logistics
  #
  # Scope
  # Logistics items
  class LogisticsReasonCode
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/ReasonCodes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsReasonCodes
    def other_attributes
      %i[
        active code created creator creator_full_name description division modified modifier
        modifier_full_name notes types
      ]
    end
  end
end
