# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountClassification
  #
  # Good to know
  # 
  #
  # Scope
  # Crm accounts
  class AccountClassification
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/AccountClassifications"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAccountClassifications
    def other_attributes
      %i[
        account_classification_name account_classification_name_description code created creator
        creator_full_name description division modified modifier modifier_full_name
      ]
    end
  end
end
