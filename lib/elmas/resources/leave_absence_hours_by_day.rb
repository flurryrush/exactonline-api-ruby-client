# frozen_string_literal: true

module Elmas
  # Endpoint
  # LeaveAbsenceHoursByDay
  #
  # Good to know
  # Use this endpoint to read employee's leave and absence hours by day.
  # The StartTime and EndTime properties will only be populated when the division is linked to Exact Officient
  #
  # Scope
  # Hrm employees
  class LeaveAbsenceHoursByDay
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/LeaveAbsenceHoursByDay"
    end

    def mandatory_attributes
      %i[
        date employee hours status type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMLeaveAbsenceHoursByDay
    def other_attributes
      %i[
        created division employee_full_name employee_hid employment employment_hid end_time
        external_id_int external_leave_absence_type modified start_time
      ]
    end
  end
end
