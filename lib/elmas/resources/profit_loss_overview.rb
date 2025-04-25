# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProfitLossOverview
  #
  # Good to know
  # Use this endpoint if you want to know the financial result of the current and previous year.
  #  The current period is determined by checking the date of the endpoint execution against the Financial Year/Period setup.
  #   E.
  # g.
  #  Date of Endpoint execution = 24-oct-2019.
  #  In your administration, the financial year 2019 period 10 has the following setup of 01-10-2019 till 31-10-2019.
  #  Current year is 2019,  current period is 10.
  #  Previous year is 2018.
  #  previous period is 10.
  #  Only P&L G/L Accounts are considered for this endpoint.
  #  Costs are balances of all G/L Account of type Costs.
  #  Revenue are balances of all G/L Account of type Revenue.
  #  Results are calculated by subtracting cost from revenue.
  #   For more information about profit and loss, kindly refer to the following help file Balance Sheet/Profit & Loss
  #
  # Scope
  # Financial accounting
  class ProfitLossOverview
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/ProfitLossOverview"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialProfitLossOverview
    def other_attributes
      %i[
        current_year costs_current_period costs_current_year costs_previous_year
        costs_previous_year_period currency_code current_period previous_year previous_year_period
        result_current_period result_current_year result_previous_year result_previous_year_period
        revenue_current_period revenue_current_year revenue_previous_year
        revenue_previous_year_period
      ]
    end
  end
end
