# frozen_string_literal: true

module Elmas
  # Endpoint
  # CurrentYearAfterEntry
  #
  # Good to know
  # This service returns opening balance amounts for G/L accounts.
  #  Only balance sheet accounts with amounts other than zero are returned.
  #  See also service Financial/ReportingBalance to get debit and credit amounts by period.
  # CurrentYear/AfterEntry considers all entries for the current year, if you only want to get final processed entries use CurrentYear/Processed instead
  #
  # Scope
  # Financial accounting
  class CurrentYearAfterEntry
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "openingbalance/CurrentYear/AfterEntry"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=OpeningBalanceCurrentYearAfterEntry
    def other_attributes
      %i[
        division gl_account reporting_year amount balance_side gl_account_code
        gl_account_description
      ]
    end
  end
end
