# frozen_string_literal: true

module Elmas
  # Endpoint
  # AgingReceivablesList
  #
  # Good to know
  # Use this endpoint to get an overview of all your customers outstanding items amount that is group by their age group.
  # You can view this information in the Ageing Analysis Report - A/R as well
  #
  # Scope
  # Financial receivables
  class AgingReceivablesList
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/AgingReceivablesList"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialAgingReceivablesList
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
