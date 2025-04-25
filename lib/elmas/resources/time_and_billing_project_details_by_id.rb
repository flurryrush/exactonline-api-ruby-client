# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingProjectDetailsByID
  #
  # Good to know
  # Use this endpoint to read and retrieve time and billing project details based on the project ID provided
  #
  # Scope
  # Projects billing
  class TimeAndBillingProjectDetailsByID
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingProjectDetailsByID"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingProjectDetailsByID
    def other_attributes
      %i[
        account account_name code description type
      ]
    end
  end
end
