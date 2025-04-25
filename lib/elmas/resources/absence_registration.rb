# frozen_string_literal: true

module Elmas
  # Endpoint
  # AbsenceRegistration
  #
  # Good to know
  # Use this endpoint to read Absence registrations.
  # This endpoint shows the employee's illness registration information.
  # 
  # Note: In case the division is linked to Exact Officient, new absence registrations will not be available in Exact Online anymore.
  #  Instead, the illness hours per day are available.
  #  Please refer to /api/v1/{division}/HRM/LeaveAbsenceHoursByDay.
  # 
  # To see if a division is linked to Exact Officient, property IsHRDivision in /api/v1/{division}/system/Divisions can be used.
  # For more information about the HRM functionality in Exact Online, see Work with leave and absence registrations
  #
  # Scope
  # Hrm employees
  class AbsenceRegistration
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/AbsenceRegistrations"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMAbsenceRegistrations
    def other_attributes
      %i[
        absence_registration_transactions cause cause_code cause_description created creator
        creator_full_name division employee employee_full_name employee_hid kind kind_code
        kind_description modified modifier modifier_full_name notes
      ]
    end
  end
end
