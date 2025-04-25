# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentConditionGroup
  #
  # Good to know
  # Use this endpoint to read employment conditions groups.
  # Employment conditions groups contain components that define the employment conditions.
  # 
  #  A division's employment conditions group is based on a predefined collective agreement.
  # 
  #  This endpoint gives the basic information of the employment conditions group.
  # For more information about the employment conditions groups functionality in Exact Online, see Work with employment conditions groups
  #
  # Scope
  # Hrm payroll
  class EmploymentConditionGroup
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "beta/{division}/payroll/EmploymentConditionGroups"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmploymentConditionGroups
    def other_attributes
      %i[
        cla_code_tax_office cla_code_tax_office_description code created creator creator_full_name
        description division end_date hours_per_week modified modifier modifier_full_name sbi_code
        sbi_code_description start_date
      ]
    end
  end
end
