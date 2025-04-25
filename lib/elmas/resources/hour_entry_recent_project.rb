# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourEntryRecentProject
  #
  # Good to know
  # Use this endpoint to read and retrieve projects that employees have used for entering hour entries order by most recently
  #
  # Scope
  # Projects billing
  class HourEntryRecentProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourEntryRecentProjects"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourEntryRecentProjects
    def other_attributes
      %i[
        project_id date_last_used project_code project_description
      ]
    end
  end
end
