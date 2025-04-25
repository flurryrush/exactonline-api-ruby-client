# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountDocumentsCount
  #
  # Good to know
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Organization documents
  class AccountDocumentsCount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/crm/AccountDocumentsCount"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadCRMAccountDocumentsCount
    def other_attributes
      %i[
        
      ]
    end
  end
end
