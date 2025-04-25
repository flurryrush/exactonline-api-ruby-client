# frozen_string_literal: true

module Elmas
  # Endpoint
  # ReportingBalanceByClassification
  #
  # Good to know
  # This service returns summarized data of financial transactions by classification.
  #  It's intended for reporting balances and period totals.
  #  The summarized amounts are grouped by: Division, ReportingYear, ReportingPeriod, G/L account, Cost center, Cost unit, Type, Status.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Financial accounting
  class ReportingBalanceByClassification
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/ReportingBalanceByClassification"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialReportingBalanceByClassification
    def other_attributes
      %i[
        amount amount_credit amount_debit balance_type classification_code
        classification_description cost_center_code cost_center_description cost_unit_code
        cost_unit_description count division gl_account gl_account_code gl_account_description
        gl_scheme reporting_period reporting_year status type
      ]
    end
  end
end
