# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentContract
  #
  # Good to know
  # Use this endpoint to read employment contracts.
  # The employment contract contains the basic information about the employee's contract.
  # For more information about the employment contracts functionality in Exact Online, see Modify an employee's contract
  #
  # Scope
  # Hrm payroll
  class EmploymentContract
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/EmploymentContracts"
    end

    def mandatory_attributes
      %i[
        employment
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmploymentContracts
    def other_attributes
      %i[
        contract_flex_phase contract_flex_phase_description create_auto_correction created
        create_predecessors_for_linked_agencies creator creator_full_name division document
        employee employee_full_name employee_hid employee_type employee_type_description
        employment_hid employment_number end_date modified modifier modifier_full_name notes
        probation_end_date probation_period probation_period_description reason_contract
        reason_contract_description sequence start_date type type_description
      ]
    end
  end
end
