# frozen_string_literal: true

module Elmas
  # Endpoint
  # PreviousYearAfterEntry
  #
  # Good to know
  # This service returns opening balance amounts for G/L accounts.
  #  Only balance sheet accounts with amounts other than zero are returned.
  #  See also service Financial/ReportingBalance to get debit and credit amounts by period.
  # PreviousYear/AfterEntry considers all entries for the previous year, if you only want to get final processed entries use PreviousYear/Processed instead
  #
  # Scope
  # Financial accounting
  class PreviousYearAfterEntry
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "openingbalance/PreviousYear/AfterEntry"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=OpeningBalancePreviousYearAfterEntry
    def other_attributes
      %i[
        division gl_account reporting_year amount balance_side gl_account_code
        gl_account_description
      ]
    end
  end
end
