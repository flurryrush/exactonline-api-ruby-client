# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentTaxAuthoritiesGeneral
  #
  # Good to know
  # Use this endpoint to read the general data from the employees tax authority.
  # The employment tax authorities general contains the general information about the employee's tax authority, like payroll tax number, type of income, nature of work relationship, influence insurance obligation and etc.
  # For more information about the employment tax authorities general functionality in Exact Online, see Payroll | Adjust employee tax information
  #
  # Scope
  # Hrm payroll
  class EmploymentTaxAuthoritiesGeneral
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/EmploymentTaxAuthoritiesGeneral"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmploymentTaxAuthoritiesGeneral
    def other_attributes
      %i[
        account created creator creator_full_name division employee employee_full_name
        employee_hid employment employment_hid employment_number end_date
        influence_insurance_obligation influence_insurance_obligation_description modified modifier
        modifier_full_name nature_of_work_relationship nature_of_work_relationship_description
        payroll_taxes_number start_date type_of_income type_of_income_description
      ]
    end
  end
end
