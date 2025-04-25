# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryProjectsByDate
  #
  # Good to know
  # Use this endpoint to read a list of projects allowed for an employee based on the Date provided.
  # Note: For getting the list, it is mandatory to supply check date
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryProjectsByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryProjectsByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryProjectsByDate
    def other_attributes
      %i[
        project_id project_code project_description
      ]
    end
  end
end
