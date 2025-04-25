# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectPlanning
  #
  # Good to know
  # Use this endpoint to create, read, update and delete project planning for employees in the division.
  # Note: The user can block out the capacity for employees or set it to reserve status first if it is not yet confirmed.
  #  Helps the user get an overview on how the employee will spend time.
  #  For POST it is mandatory to provide Description, Employee, EndDate, HourType, StartDate, Status
  #
  # Scope
  # Projects projects
  class ProjectPlanning
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectPlanning"
    end

    def mandatory_attributes
      %i[
        description employee end_date hour_type start_date status
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectPlanning
    def other_attributes
      %i[
        account account_code account_name bgt_status communication_error_status created creator
        creator_full_name custom_field division employee_code employee_hid hours hour_type_code
        hour_type_description is_broken_recurrence modified modifier modifier_full_name notes
        over_allocate project project_code project_description project_planning_recurring
        project_wbs project_wbs_description type
      ]
    end
  end
end
