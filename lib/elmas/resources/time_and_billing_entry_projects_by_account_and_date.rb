# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryProjectsByAccountAndDate
  #
  # Good to know
  # This endpoint enables users to retrieve a list of projects allowed for an employee based on the Account and Date provided.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryProjectsByAccountAndDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryProjectsByAccountAndDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryProjectsByAccountAndDate
    def other_attributes
      %i[
        project_id project_code project_description
      ]
    end
  end
end
