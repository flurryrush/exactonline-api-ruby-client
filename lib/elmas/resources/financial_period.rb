# frozen_string_literal: true

module Elmas
  # Endpoint
  # FinancialPeriod
  #
  # Good to know
  # This endpoint provides insight in how the financial year of a company is set up.
  #  A financial year can differ from a calendar year.
  #  FinancialPeriods provides all periods of the financial year with their start and end date
  #
  # Scope
  # Financial accounting
  class FinancialPeriod
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financial/FinancialPeriods"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialFinancialPeriods
    def other_attributes
      %i[
        created creator creator_full_name division end_date fin_period fin_year modified modifier
        modifier_full_name start_date
      ]
    end
  end
end
