# frozen_string_literal: true

module Elmas
  # Endpoint
  # RevenueListByYearAndStatus
  #
  # Good to know
  # Use this endpoint to get an overview of the revenue per period in a chosen year.
  #  Revenue amount is calculated from all G/L accounts of type revenue.
  #  AfterEntry parameter helps to decide whether calculation should be done on entered entries or only on finally processed entries.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Financial accounting
  class RevenueListByYearAndStatus
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/RevenueListByYearAndStatus"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialRevenueListByYearAndStatus
    def other_attributes
      %i[
        period year amount
      ]
    end
  end
end
