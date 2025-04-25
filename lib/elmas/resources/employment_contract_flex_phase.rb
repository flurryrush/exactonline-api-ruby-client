# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentContractFlexPhase
  #
  # Good to know
  # Use this endpoint to read employment contract flex phases.
  # An employment contract flex phase is used for flexworkers to indicate the phase 
  #   in which the income ratio is, in context of the 'Wet Flexibiliteit en Zekerheid'.
  # 
  #   With the tax authority this phase is known as 'Code fase indeling F&Z'.
  # 
  #   The phase is set in the employment contract, that can be read using the EmploymentContracts endpoint.
  # 
  #   This API has been deprecated and only returns the employment contract flex phases that were active before 2022.
  # 
  #   Please Use the EmploymentContractFlexPhasesOnFocusDate for payroll year 2022 and onwards
  #
  # Scope
  # Hrm payroll
  class EmploymentContractFlexPhase
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/EmploymentContractFlexPhases"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmploymentContractFlexPhases
    def other_attributes
      %i[
        description
      ]
    end
  end
end
