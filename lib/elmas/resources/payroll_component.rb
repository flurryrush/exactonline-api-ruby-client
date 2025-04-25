# frozen_string_literal: true

module Elmas
  # Endpoint
  # PayrollComponent
  #
  # Good to know
  # Use this endpoint to read payroll components.
  # This endpoint gives a list of payroll components that are part of the specified employment conditions group.
  # For more information about the payrol components functionality in Exact Online, see Work with payroll components
  #
  # Scope
  # Hrm payroll
  class PayrollComponent
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "beta/{division}/payroll/PayrollComponents"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollPayrollComponents
    def other_attributes
      %i[
        calculate category category_description code created creator creator_full_name description
        division employment_condition_group_code employment_condition_group_description end_date
        gl_classification gl_classification_description modified modifier modifier_full_name
        pension_declaration_classification pension_declaration_classification_description
        pension_declaration_subclassification pension_declaration_subclassification_description
        search_code start_date subcategory subcategory_description tax_declaration_classification
        tax_declaration_classification_description transaction_type type wage_list_classification
        wage_list_classification_description
      ]
    end
  end
end
