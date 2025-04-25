# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectHourBudget
  #
  # Good to know
  # This endpoint enables users to maintain budgeted hours per hour type of a project.
  # Hours per hour type means you can budget the expected number of hours to finish the project and you create this for each hour type you need
  #
  # Scope
  # Projects projects
  class ProjectHourBudget
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectHourBudgets"
    end

    def mandatory_attributes
      %i[
        budget item project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectHourBudgets
    def other_attributes
      %i[
        created creator creator_full_name division item_code item_description modified modifier
        modifier_full_name project_code project_description
      ]
    end
  end
end
