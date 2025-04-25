# frozen_string_literal: true

module Elmas
  # Endpoint
  # OpportunityDocumentsCount
  #
  # Good to know
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Crm opportunities
  class OpportunityDocumentsCount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/crm/OpportunityDocumentsCount"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadCRMOpportunityDocumentsCount
    def other_attributes
      %i[
        
      ]
    end
  end
end
