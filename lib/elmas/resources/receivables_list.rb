# frozen_string_literal: true

module Elmas
  # Endpoint
  # ReceivablesList
  #
  # Good to know
  # Use this endpoint to get all your customers payment terms information.
  #  Payment term are created when an sales invoice is created or when money is collected from the customer.
  # You can view this information in the Outstanding items report as well
  #
  # Scope
  # Financial receivables
  class ReceivablesList
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/ReceivablesList"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialReceivablesList
    def other_attributes
      %i[
        hid account_code account_id account_name amount amount_in_transit currency_code
        description due_date entry_number invoice_date invoice_number journal_code
        journal_description notes your_ref
      ]
    end
  end
end
