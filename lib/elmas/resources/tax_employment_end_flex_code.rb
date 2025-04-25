# frozen_string_literal: true

module Elmas
  # Endpoint
  # TaxEmploymentEndFlexCode
  #
  # Good to know
  # Use this endpoint to read employment end flex codes.
  # An employment end flex code is used for flexworkers to indicate the reason that the employment is ended.
  # 
  #   With the tax authority this phase is known as 'Code reden einde inkomstenverhouding flexwerker'.
  # 
  #   The reason is set in the employment, that can be read using the Employments endpoint
  #
  # Scope
  # Hrm payroll
  class TaxEmploymentEndFlexCode
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/TaxEmploymentEndFlexCodes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollTaxEmploymentEndFlexCodes
    def other_attributes
      %i[
        code created creator creator_full_name description end_date modified modifier
        modifier_full_name start_date
      ]
    end
  end
end
