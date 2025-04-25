# frozen_string_literal: true

module Elmas
  # Endpoint
  # CRMReasonCode
  #
  # Good to know
  # 
  #
  # Scope
  # Crm quotes
  class CRMReasonCode
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/ReasonCodes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMReasonCodes
    def other_attributes
      %i[
        active code created creator creator_full_name description division modified modifier
        modifier_full_name notes type type_description
      ]
    end
  end
end
