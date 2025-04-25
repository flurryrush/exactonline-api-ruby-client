# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryAccount
  #
  # Good to know
  # This endpoint enables users to retrieve currently active account details
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryAccount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryAccounts"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryAccounts
    def other_attributes
      %i[
        account_id account_name
      ]
    end
  end
end
