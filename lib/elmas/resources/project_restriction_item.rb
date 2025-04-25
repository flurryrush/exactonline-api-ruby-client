# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectRestrictionItem
  #
  # Good to know
  # Use this endpoint to restrict which hour/cost types can be used in time/cost entries for the project.
  # Note: For creating project restriction item, it is mandatory to supply Item and Project
  #
  # Scope
  # Projects projects
  class ProjectRestrictionItem
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectRestrictionItems"
    end

    def mandatory_attributes
      %i[
        item project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectRestrictionItems
    def other_attributes
      %i[
        created creator creator_full_name division item_code item_description item_is_time
        modified modifier modifier_full_name project_code project_description
      ]
    end
  end
end
