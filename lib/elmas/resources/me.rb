# frozen_string_literal: true

module Elmas
  # Endpoint
  # Me
  #
  # Good to know
  # This end point retrieves information about the current user
  #
  # Scope
  # -
  class Me
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "current/Me"
    end

    def mandatory_attributes
      %i[

      ]
    end

    def no_division?
      true
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SystemSystemMe
    def other_attributes
      %i[
        user_id accounting_division current_division customer_code division_customer
        division_customer_code division_customer_name division_customer_siret_number
        division_customer_vat_number dossier_division email employee_id first_name full_name gender
        initials is_client_user is_employee_self_service_user is_my_firm_lite_user
        is_my_firm_portal_user is_oei_migration_mandatory is_starter_user language language_code
        last_name legislation middle_name mobile nationality package_code phone phone_extension
        picture_url server_time server_utc_offset thumbnail_picture thumbnail_picture_format title
        user_name
      ]
    end
  end
end
