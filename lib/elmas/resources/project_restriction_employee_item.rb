# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectRestrictionEmployeeItem
  #
  # Good to know
  # Use this endpoint to create, read, update and delete project restriction employee items, it restricts employee's hour types that can be used in time entries for the project.
  # Note: For creating project restriction employee item, you need to have existing project restriction employee.
  #  The supplied item needs to be a time unit item
  #
  # Scope
  # Projects projects
  class ProjectRestrictionEmployeeItem
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectRestrictionEmployeeItems"
    end

    def mandatory_attributes
      %i[
        employee item project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectRestrictionEmployeeItems
    def other_attributes
      %i[
        created creator creator_full_name division employee_full_name employee_hid item_code
        item_description item_is_time modified modifier modifier_full_name project_code
        project_description
      ]
    end
  end
end
