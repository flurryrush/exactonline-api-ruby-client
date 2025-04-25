# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryAccountsByProjectAndDate
  #
  # Good to know
  # This endpoint enables users to retrieve the account related to the project ID as of the date provided as the parameters.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryAccountsByProjectAndDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryAccountsByProjectAndDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryAccountsByProjectAndDate
    def other_attributes
      %i[
        account_id account_name
      ]
    end
  end
end
