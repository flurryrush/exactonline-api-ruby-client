# frozen_string_literal: true

module Elmas
  # Endpoint
  # CurrentYearProcessed
  #
  # Good to know
  # This service returns opening balance amounts for G/L accounts.
  #  Only balance sheet accounts with amounts other than zero are returned.
  #  See also service Financial/ReportingBalance to get debit and credit amounts by period.
  # CurrentYear/Processed considers only processed entries for the current year, if you want to get all the entries use CurrentYear/AfterEntry instead
  #
  # Scope
  # Financial accounting
  class CurrentYearProcessed
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "openingbalance/CurrentYear/Processed"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=OpeningBalanceCurrentYearProcessed
    def other_attributes
      %i[
        division gl_account reporting_year amount balance_side gl_account_code
        gl_account_description
      ]
    end
  end
end
