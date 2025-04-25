# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentEndReason
  #
  # Good to know
  # Use this endpoint to read employment end reasons.
  # The reason is set when the employment is ended.
  #  This API has been deprecated and only returns the employment end reasons that were active before 2020.
  # 
  #  Use the EmploymentEndReasonsOnFocusDate for payroll year 2020 and onwards.
  # For more information about the employments functionality in Exact Online, see End an employee's contract
  #
  # Scope
  # Hrm payroll
  class EmploymentEndReason
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/EmploymentEndReasons"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmploymentEndReasons
    def other_attributes
      %i[
        description
      ]
    end
  end
end
