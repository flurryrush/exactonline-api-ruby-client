# frozen_string_literal: true

module Elmas
  # Endpoint
  # AllDivision
  #
  # Good to know
  # Returns all (non-deleted) divisions of a single license, being the license that owns the division specified in the URI.
  #  Typically this will be the signed-in user's license, but for an accountant it can be a client's license instead.
  #  Most users will see all divisions that are in the relevant license (including divisions they do not have access rights to), but if the license is not user's (i.
  # e.
  #  accountant in client's division), or if the user has limited rights ('view user'), then only divisions that are accessible to the user will be returned.
  # Please note that divisions returned are only those which the user has granted permission to
  #
  # Scope
  # Organization administration
  class AllDivision
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "system/AllDivisions"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SystemSystemAllDivisions
    def other_attributes
      %i[
        code address_line1 address_line2 address_line3 archive_date blocking_status
        business_type_code business_type_description chamber_of_commerce_establishment
        chamber_of_commerce_number city class_01 class_02 class_03 class_04 class_05
        company_size_code company_size_description country created creator creator_full_name
        currency current customer customer_code customer_name datev_accountant_number
        datev_client_number description division_hr_link_unlink_date division_move_date email fax
        hid is_dossier_division is_hr_division is_main_division is_practice_division legislation
        modified modifier modifier_full_name ob_number phone postcode sbi_code sbi_description
        sector_code sector_description share_capital siret_number start_date state status
        subsector_code subsector_description tax_office_number tax_reference_number template_code
        vat_number website
      ]
    end
  end
end
