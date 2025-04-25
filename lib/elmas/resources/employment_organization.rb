# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentOrganization
  #
  # Good to know
  # Use this endpoint to read employment organizations.
  # The employment organization contains the basic information about the employee's organizational data, like job title and department.
  # For more information about the employment organizations functionality in Exact Online, see Maintenance organization
  #
  # Scope
  # Hrm payroll
  class EmploymentOrganization
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/EmploymentOrganizations"
    end

    def mandatory_attributes
      %i[
        department employment job_title
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmploymentOrganizations
    def other_attributes
      %i[
        cost_center cost_center_description cost_unit cost_unit_description created creator
        creator_full_name department_code department_description division employee
        employee_full_name employee_hid employment_hid employment_number end_date job_title_code
        job_title_description modified modifier modifier_full_name notes start_date
      ]
    end
  end
end
