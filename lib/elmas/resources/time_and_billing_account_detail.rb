# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingAccountDetail
  #
  # Good to know
  # This endpoint enables users to retrieve the account details
  #
  # Scope
  # Projects billing
  class TimeAndBillingAccountDetail
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingAccountDetails"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingAccountDetails
    def other_attributes
      %i[
        name
      ]
    end
  end
end
