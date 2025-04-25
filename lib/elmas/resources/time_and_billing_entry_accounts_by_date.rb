# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryAccountsByDate
  #
  # Good to know
  # This endpoint enables users to retrieve all accounts still active as of the date provided as the parameter
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryAccountsByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryAccountsByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryAccountsByDate
    def other_attributes
      %i[
        account_id account_name
      ]
    end
  end
end
