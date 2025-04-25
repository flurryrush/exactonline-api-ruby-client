# frozen_string_literal: true

module Elmas
  # Endpoint
  # RevenueListByYear
  #
  # Good to know
  # Use this endpoint to get an overview of the revenue per period in a chosen year.
  #  Revenue amount is calculated from all G/L accounts of type revenue.
  #  If you want get the revenue for finally processed entries only, check RevenueListByYearAndStatus instead
  #
  # Scope
  # Financial accounting
  class RevenueListByYear
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/RevenueListByYear"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialRevenueListByYear
    def other_attributes
      %i[
        period year amount
      ]
    end
  end
end
