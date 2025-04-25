# frozen_string_literal: true

module Elmas
  # Endpoint
  # LeaveRegistration
  #
  # Good to know
  # Use this endpoint to read Leave registrations.
  # Note: In case the division is linked to Exact Officient, new leave registrations will not be available in Exact Online anymore.
  #  Instead, the leave hours per day are available.
  #  Please refer to /api/v1/{division}/HRM/LeaveAbsenceHoursByDay.
  # 
  # To see if a division is linked to Exact Officient, property IsHRDivision in /api/v1/{division}/system/Divisions can be used.
  # For more information about the HRM functionality in Exact Online, see Work with leave and absence registrations
  #
  # Scope
  # Hrm employees
  class LeaveRegistration
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/LeaveRegistrations"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMLeaveRegistrations
    def other_attributes
      %i[
        created creator creator_full_name description division employee employee_full_name
        employee_hid end_date end_time hours hours_first_day hours_last_day leave_type
        leave_type_code leave_type_description modified modifier modifier_full_name notes
        start_date start_time status
      ]
    end
  end
end
