# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectClassification
  #
  # Good to know
  # Use this endpoint to create, read, update and delete project classifications.
  # Note: For creating a project classifications, it is mandatory to supply Code and Description
  #
  # Scope
  # Projects projects
  class ProjectClassification
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectClassifications"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectClassifications
    def other_attributes
      %i[
        cost_center cost_center_description cost_unit cost_unit_description created creator
        creator_full_name division division_name modified modifier modifier_full_name
        use_employee_cost_center
      ]
    end
  end
end
