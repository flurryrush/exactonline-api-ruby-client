# frozen_string_literal: true

module Elmas
  # Endpoint
  # RevenueList
  #
  # Good to know
  # Use this endpoint to get an overview of the revenue per period in the current year.
  #  Revenue amount is calculated from all G/L accounts of type revenue.
  #  If you want get the revenue for a specific year only, check RevenueListByYear instead
  #
  # Scope
  # Financial accounting
  class RevenueList
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/RevenueList"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialRevenueList
    def other_attributes
      %i[
        period year amount
      ]
    end
  end
end
