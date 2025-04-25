# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingProjectDetail
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Projects with details
  #
  # Scope
  # Projects billing
  class TimeAndBillingProjectDetail
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingProjectDetails"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingProjectDetails
    def other_attributes
      %i[
        account account_name code description type
      ]
    end
  end
end
