# frozen_string_literal: true

module Elmas
  # Endpoint
  # PayablesListByAccountAndAgeGroup
  #
  # Good to know
  # Use this endpoint to get a specific suppliers payment terms information that falls under a specific age group.
  #  Payment term are created when an purchase invoice is created or when money is paid to the supplier.
  # Below are the values for the age group 1 = for invoice that age between 0-30 days2 = for invoice that age between 31-60 days3 = for invoice that age between 61-90 days4 = for invoice that age more than 90 daysYou can view this information in the Outstanding items report, Ageing Analysis Report as well.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Financial payables
  class PayablesListByAccountAndAgeGroup
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/PayablesListByAccountAndAgeGroup"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialPayablesListByAccountAndAgeGroup
    def other_attributes
      %i[
        hid account_code account_id account_name amount amount_in_transit approval_status
        currency_code description due_date entry_number invoice_date invoice_number journal_code
        journal_description notes your_ref
      ]
    end
  end
end
