# frozen_string_literal: true

module Elmas
  # Endpoint
  # AgingPayablesListByAgeGroup
  #
  # Good to know
  # Use this endpoint to get an overview of all your suppliers outstanding items amount in a specific age group.
  # You can view this information in the Ageing Analysis Report - A/P as well
  #
  # Scope
  # Financial payables
  class AgingPayablesListByAgeGroup
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/AgingPayablesListByAgeGroup"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialAgingPayablesListByAgeGroup
    def other_attributes
      %i[
        account_id account_code account_name age_group1 age_group1_amount age_group1_description
        age_group2 age_group2_amount age_group2_description age_group3 age_group3_amount
        age_group3_description age_group4 age_group4_amount age_group4_description currency_code
        total_amount
      ]
    end
  end
end
