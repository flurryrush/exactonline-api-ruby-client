# frozen_string_literal: true

module Elmas
  # Endpoint
  # Division
  #
  # Good to know
  # Returns only divisions that are accessible to the signed-in user, as configured in the user card under 'Companies: Access rights'.
  #  Accountants will see both their own divisions and those belonging to their clients.
  # Please note that divisions returned are only those which the user has granted permission to.
  # For delete the user has to have sufficient access rights to perform the delete operation
  #
  # Scope
  # Organization administration
  class Division
    include Elmas::Resource

    def valid_actions
      %i[get delete]
    end

    def base_path
      "system/Divisions"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SystemSystemDivisions
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
