# frozen_string_literal: true

module Elmas
  # Endpoint
  # ActiveEmployment
  #
  # Good to know
  # Use this endpoint to read active employments.
  # This endpoint gives the basic information of the employee's employment that is active at this moment.
  # 
  #  An employment consists of multiple parts, like contract, organization and salary.
  #  
  #  For each, the detailed information can be read using the specifc endpoint.
  # For more information about the employments functionality in Exact Online, see Working with employees in Exact Online
  #
  # Scope
  # Hrm payroll
  class ActiveEmployment
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/ActiveEmployments"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollActiveEmployments
    def other_attributes
      %i[
        average_days_per_week average_hours_per_week contract contract_document contract_end_date
        contract_probation_end_date contract_probation_period contract_start_date contract_type
        contract_type_description created creator creator_full_name department department_code
        department_description division employee employee_full_name employee_hid
        employment_organization end_date hid hourly_wage internal_rate jobtitle
        jobtitle_description modified modifier modifier_full_name reason_end reason_end_description
        reason_end_flex reason_end_flex_description salary schedule schedule_average_hours
        schedule_code schedule_days schedule_description schedule_hours start_date
        start_date_organization
      ]
    end
  end
end
