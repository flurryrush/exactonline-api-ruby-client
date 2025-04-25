# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentInternalRate
  #
  # Good to know
  # Use this endpoint to retrieve internal rates of employees
  #
  # Scope
  # Projects billing
  class EmploymentInternalRate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "project/EmploymentInternalRates"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectEmploymentInternalRates
    def other_attributes
      %i[
        created creator creator_full_name division employee employee_full_name employee_hid
        employment employment_hid end_date intercompany_rate internal_rate modified modifier
        modifier_full_name start_date
      ]
    end
  end
end
