# frozen_string_literal: true

module Elmas
  # Endpoint
  # AddressState
  #
  # Good to know
  # 
  #
  # Scope
  # Crm accounts
  class AddressState
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/AddressStates"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAddressStates
    def other_attributes
      %i[
        country display_value latitude longitude name state
      ]
    end
  end
end
