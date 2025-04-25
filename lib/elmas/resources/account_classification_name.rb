# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountClassificationName
  #
  # Good to know
  # 
  #
  # Scope
  # Crm accounts
  class AccountClassificationName
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/AccountClassificationNames"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAccountClassificationNames
    def other_attributes
      %i[
        created creator creator_full_name description division modified modifier
        modifier_full_name sequence_number
      ]
    end
  end
end
