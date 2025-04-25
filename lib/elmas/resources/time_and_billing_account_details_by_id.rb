# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingAccountDetailsByID
  #
  # Good to know
  # This endpoint enables users to retrieve the account details
  #
  # Scope
  # Projects billing
  class TimeAndBillingAccountDetailsByID
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingAccountDetailsByID"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingAccountDetailsByID
    def other_attributes
      %i[
        name
      ]
    end
  end
end
