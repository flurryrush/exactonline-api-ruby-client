# frozen_string_literal: true

module Elmas
  # Endpoint
  # Employment
  #
  # Good to know
  # Use this endpoint to read employments.
  # This endpoint gives the basic information of the employee's employment.
  # 
  #  An employment consists of multiple parts, like contract, organization and salary.
  #  
  #  For each, the detailed information can be read using the specifc endpoint.
  # 
  #  To get the active employments only, the endpoint ActiveEmployments can be used.
  # For more information about the employments functionality in Exact Online, see Working with employees in Exact Online
  #
  # Scope
  # Hrm payroll
  class Employment
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/Employments"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmployments
    def other_attributes
      %i[
        created creator creator_full_name division employee employee_full_name employee_hid
        employment_number end_date hid modified modifier modifier_full_name reason_end
        reason_end_description reason_end_flex reason_end_flex_description start_date
        start_date_organization
      ]
    end
  end
end
