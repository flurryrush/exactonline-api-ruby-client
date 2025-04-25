# frozen_string_literal: true

module Elmas
  # Endpoint
  # Schedule
  #
  # Good to know
  # Use this endpoint to read Schedules.
  # For more information about the Payroll functionality in Exact Online, see Working with employee's schedules
  #
  # Scope
  # Hrm employees
  class Schedule
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/Schedules"
    end

    def mandatory_attributes
      %i[
        average_hours employment schedule_type start_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMSchedules
    def other_attributes
      %i[
        active billability_target code created creator creator_full_name days description division
        employee employee_full_name employment_cla employment_hid employment_number end_date hours
        leave_hours_compensation main modified modifier modifier_full_name payment_parttime_factor
        schedule_entries schedule_type_description start_week
      ]
    end
  end
end
