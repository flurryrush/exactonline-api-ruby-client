# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostEntryRecentProject
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Projects used by an employee for cost entries.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects projects
  class CostEntryRecentProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostEntryRecentProjects"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostEntryRecentProjects
    def other_attributes
      %i[
        project_id date_last_used project_code project_description
      ]
    end
  end
end
