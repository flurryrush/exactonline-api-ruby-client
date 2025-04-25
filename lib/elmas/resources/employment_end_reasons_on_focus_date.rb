# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentEndReasonsOnFocusDate
  #
  # Good to know
  # Use this endpoint to read employment end reasons on focus date.
  # The reason is set when the employment is ended.
  #  Use this end point from payroll year 2020 and onwards.
  # For more information about the employments functionality in Exact Online, see End an employee's contract
  #
  # Scope
  # Hrm payroll
  class EmploymentEndReasonsOnFocusDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/payroll/EmploymentEndReasonsOnFocusDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadPayrollEmploymentEndReasonsOnFocusDate
    def other_attributes
      %i[
        code description end_date start_date
      ]
    end
  end
end
