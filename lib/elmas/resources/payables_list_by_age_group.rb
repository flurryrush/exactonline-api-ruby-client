# frozen_string_literal: true

module Elmas
  # Endpoint
  # PayablesListByAgeGroup
  #
  # Good to know
  # Use this endpoint to get all your suppliers payment terms information that falls under a specific age group.
  #  Payment term are created when an purchase invoice is created or when money is paid to the supplier.
  # Below are the values for the age group 1 = for invoice that age between 0-30 days2 = for invoice that age between 31-60 days 3 = for invoice that age between 61-90 days4 = for invoice that age more than 90 daysYou can view this information in the Outstanding items report, Ageing Analysis Report as well
  #
  # Scope
  # Financial payables
  class PayablesListByAgeGroup
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/PayablesListByAgeGroup"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialPayablesListByAgeGroup
    def other_attributes
      %i[
        hid account_code account_id account_name amount amount_in_transit approval_status
        currency_code description due_date entry_number invoice_date invoice_number journal_code
        journal_description notes your_ref
      ]
    end
  end
end
