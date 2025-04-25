# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourEntryRecentAccountsByProject
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Accounts used by an employee for hour entries based on the Project Id provided.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects billing
  class HourEntryRecentAccountsByProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourEntryRecentAccountsByProject"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourEntryRecentAccountsByProject
    def other_attributes
      %i[
        account_id account_name date_last_used
      ]
    end
  end
end
