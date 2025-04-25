# frozen_string_literal: true

module Elmas
  # Endpoint
  # Department
  #
  # Good to know
  # Use this endpoint to read Departments.
  # Departments are used in Employment organizations and Active employments.
  # For more information about the HRM functionality in Exact Online, see Create and update departments
  #
  # Scope
  # Hrm employees
  class Department
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/Departments"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMDepartments
    def other_attributes
      %i[
        code costcenter costcenter_description created creator creator_full_name description
        division modified modifier modifier_full_name notes
      ]
    end
  end
end
