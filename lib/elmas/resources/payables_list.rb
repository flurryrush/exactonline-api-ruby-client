# frozen_string_literal: true

module Elmas
  # Endpoint
  # PayablesList
  #
  # Good to know
  # Use this endpoint to get all your suppliers payment terms information.
  #  Payment term are created when an purchase invoice is created or when money is paid to the supplier.
  # You can view this information in the Outstanding items report as well
  #
  # Scope
  # Financial payables
  class PayablesList
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/PayablesList"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialPayablesList
    def other_attributes
      %i[
        hid account_code account_id account_name amount amount_in_transit approval_status
        currency_code description due_date entry_number invoice_date invoice_number journal_code
        journal_description notes your_ref
      ]
    end
  end
end
