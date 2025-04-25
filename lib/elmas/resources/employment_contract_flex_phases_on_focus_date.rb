# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentContractFlexPhasesOnFocusDate
  #
  # Good to know
  # Use this endpoint to read employment contract flex phases on focus date.
  # The phase is set in the employment contract, that can be read using the EmploymentContracts endpoint
  #
  # Scope
  # Hrm payroll
  class EmploymentContractFlexPhasesOnFocusDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/payroll/EmploymentContractFlexPhasesOnFocusDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadPayrollEmploymentContractFlexPhasesOnFocusDate
    def other_attributes
      %i[
        code description end_date start_date
      ]
    end
  end
end
