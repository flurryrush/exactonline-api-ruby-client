# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectPlanningRecurring
  #
  # Good to know
  # This endpoint enables users to maintain recurring planning for employees in the division.
  #  If it Is a recurring event, the user can just block it out at set intervals every day, week Or month, up to 500 instances
  #
  # Scope
  # Projects projects
  class ProjectPlanningRecurring
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectPlanningRecurring"
    end

    def mandatory_attributes
      %i[
        description employee hour_type start_date status
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectPlanningRecurring
    def other_attributes
      %i[
        account account_code account_name bgt_status created creator creator_full_name
        custom_field day_or_the division employee_code employee_hid end_date end_date_or_after
        end_time hours hour_type_code hour_type_description modified modifier modifier_full_name
        month_pattern_day month_pattern_ordinal_day month_pattern_ordinal_week notes
        number_of_recurrences over_allocate pattern_frequency project project_code
        project_description project_planning_recurring_type project_wbs project_wbs_description
        start_time week_pattern_day week_pattern_friday week_pattern_monday week_pattern_saturday
        week_pattern_sunday week_pattern_thursday week_pattern_tuesday week_pattern_wednesday
      ]
    end
  end
end
