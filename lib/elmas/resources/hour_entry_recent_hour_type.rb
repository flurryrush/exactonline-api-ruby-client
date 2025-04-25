# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourEntryRecentHourType
  #
  # Good to know
  # Use this endpoint to read a list of items that is used by an employee to create hour entries.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects billing
  class HourEntryRecentHourType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourEntryRecentHourTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourEntryRecentHourTypes
    def other_attributes
      %i[
        item_id date_last_used is_valid item_code item_description
      ]
    end
  end
end
