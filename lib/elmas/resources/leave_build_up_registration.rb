# frozen_string_literal: true

module Elmas
  # Endpoint
  # LeaveBuildUpRegistration
  #
  # Good to know
  # Use this endpoint to read Leave build up registrations.
  # Note: In case the division is linked to Exact Officient, new leave build up registrations will not be available in Exact Online anymore.
  # 
  # To see if a division is linked to Exact Officient, property IsHRDivision in /api/v1/{division}/system/Divisions can be used.
  # For more information about the HRM functionality in Exact Online, see View leave build up registrations
  #
  # Scope
  # Hrm employees
  class LeaveBuildUpRegistration
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/LeaveBuildUpRegistrations"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMLeaveBuildUpRegistrations
    def other_attributes
      %i[
        created creator creator_full_name date description division employee employee_full_name
        employee_hid hours leave_type leave_type_code leave_type_description modified modifier
        modifier_full_name notes status
      ]
    end
  end
end
