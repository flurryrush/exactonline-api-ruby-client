# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourEntryActivitiesByProject
  #
  # Good to know
  # This endpoint enables users to retrieve a list of WBS Activities and its parent Deliverable based on the project ID provided
  #
  # Scope
  # Projects billing
  class HourEntryActivitiesByProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourEntryActivitiesByProject"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourEntryActivitiesByProject
    def other_attributes
      %i[
        default_item default_item_code default_item_description description parent_description
      ]
    end
  end
end
