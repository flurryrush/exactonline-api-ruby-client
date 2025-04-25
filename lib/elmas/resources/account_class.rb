# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountClass
  #
  # Good to know
  # 
  #
  # Scope
  # Crm accounts
  class AccountClass
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/AccountClasses"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAccountClasses
    def other_attributes
      %i[
        code created creator creator_full_name credit_management_scenario description division
        modified modifier modifier_full_name
      ]
    end
  end
end
