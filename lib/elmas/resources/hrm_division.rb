# frozen_string_literal: true

module Elmas
  # Endpoint
  # HRMDivision
  #
  # Good to know
  # Returns only divisions that are accessible to the signed-in user, as configured in the user card under 'Companies: Access rights'.
  #  Accountants will only see divisions that belong to a single license (either their own or a client's), being the license that owns the division specified in the URI.
  # Please note that divisions returned are only those which the user has granted permission to.
  # Recommended alternative that is not limited to accessible divisions: /api/v1/{division}/system/AllDivisionsRecommended alternative that is not limited to a single license: /api/v1/{division}/system/Divisions
  #
  # Scope
  # -
  class HRMDivision
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/Divisions"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMDivisions
    def other_attributes
      %i[
        code archive_date blocking_status class_01 class_02 class_03 class_04 class_05 country
        country_description created creator creator_full_name currency currency_description
        customer customer_code customer_name description hid main modified modifier
        modifier_full_name ob_number siret_number start_date status tax_office_number
        tax_reference_number template_code vat_number website
      ]
    end
  end
end
