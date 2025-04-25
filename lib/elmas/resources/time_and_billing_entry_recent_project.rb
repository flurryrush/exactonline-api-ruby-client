# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryRecentProject
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Projects used by an employee for hour and cost entries.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryRecentProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryRecentProjects"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryRecentProjects
    def other_attributes
      %i[
        project_id date_last_used project_code project_description
      ]
    end
  end
end
