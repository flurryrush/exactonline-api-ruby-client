# frozen_string_literal: true

module Elmas
  # Endpoint
  # AgingOverview
  #
  # Good to know
  # Use this endpoint to get an overview of your suppliers/customers outstanding items amount that is group by their age (e.
  # g.
  #  How many days after creation).
  # You can view this information in the Ageing Analysis Report - A/R, Ageing Analysis Report - A/P as well
  #
  # Scope
  # Financial receivables financial payables
  class AgingOverview
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/AgingOverview"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialAgingOverview
    def other_attributes
      %i[
        age_group age_group_description amount_payable amount_receivable currency_code
      ]
    end
  end
end
