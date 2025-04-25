# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectRestrictionEmployee
  #
  # Good to know
  # Use this endpoint to create, read, update and delete employees which are restricted to enter time/cost entries in specific project.
  # Note: For creating a project restriction link, it is mandatory to supply one or more Employee and Project
  #
  # Scope
  # Projects projects
  class ProjectRestrictionEmployee
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectRestrictionEmployees"
    end

    def mandatory_attributes
      %i[
        employee project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectRestrictionEmployees
    def other_attributes
      %i[
        created creator creator_full_name division employee_full_name employee_hid modified
        modifier modifier_full_name project_code project_description
      ]
    end
  end
end
