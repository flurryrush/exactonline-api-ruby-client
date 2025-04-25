# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourEntryRecentHourTypesByProject
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Items used by an employee for hour entries based on the Project Id provided.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects billing
  class HourEntryRecentHourTypesByProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourEntryRecentHourTypesByProject"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourEntryRecentHourTypesByProject
    def other_attributes
      %i[
        item_id date_last_used is_valid item_code item_description
      ]
    end
  end
end
