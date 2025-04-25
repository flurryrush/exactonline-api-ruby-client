# frozen_string_literal: true

module Elmas
  # Endpoint
  # PayrollTransactionsByPayrollYear
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # Only the following filters are supported for this endpoint:
  # Employment, Frequency, PayrollComponent, PayrollYear, Period, Status
  # 
  #
  # Scope
  # Hrm payroll
  class PayrollTransactionsByPayrollYear
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "beta/{division}/payroll/PayrollTransactionsByPayrollYear"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollPayrollTransactionsByPayrollYear
    def other_attributes
      %i[
        calculated_amount calculated_base_value calculated_franchise calculated_maximum
        calculated_number cost_center cost_center_code cost_center_description cost_unit
        cost_unit_code cost_unit_description created creator creator_full_name date department
        department_code department_description division employee employee_hid employment
        employment_condition_group employment_condition_group_code
        employment_condition_group_description entry_amount entry_base entry_number
        entry_percentage entry_percentage2 entry_type entry_type_description frequency full_name
        modified_date modifier modifier_full_name payroll_component payroll_component_code
        payroll_component_description payroll_component_type payroll_component_type_description
        payroll_run payroll_run_code payroll_year period status type type_description
      ]
    end
  end
end
