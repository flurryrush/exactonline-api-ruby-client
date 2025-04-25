# frozen_string_literal: true

module Elmas
  # Endpoint
  # AbsenceRegistrationTransaction
  #
  # Good to know
  # Use this endpoint to read Absence registrations.
  # This endpoint shows the employee information which contains the details and recovery stages of the illness registrations.
  # 
  # Note: In case the division is linked to Exact Officient, new absence registrations will not be available in Exact Online anymore.
  #  Instead, the illness hours per day are available.
  #  Please refer to /api/v1/{division}/HRM/LeaveAbsenceHoursByDay.
  # 
  # To see if a division is linked to Exact Officient, property IsHRDivision in /api/v1/{division}/system/Divisions can be used.
  # For more information about the HRM functionality in Exact Online, see Working with Absence registrations
  #
  # Scope
  # Hrm employees
  class AbsenceRegistrationTransaction
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/AbsenceRegistrationTransactions"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMAbsenceRegistrationTransactions
    def other_attributes
      %i[
        absence_registration created creator creator_full_name division end_time expected_end_date
        hours hours_first_day hours_last_day modified modifier modifier_full_name notes
        notification_moment percentage_disablement start_date start_time status
      ]
    end
  end
end
