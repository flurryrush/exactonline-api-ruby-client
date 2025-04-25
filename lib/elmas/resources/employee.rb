# frozen_string_literal: true

module Elmas
  # Endpoint
  # Employee
  #
  # Good to know
  # Use this endpoint to read employees.
  # For more information about the employees functionality in Exact Online, see Working with employees in Exact Online
  #
  # Scope
  # Hrm payroll
  class Employee
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/Employees"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmployees
    def other_attributes
      %i[
        active_employment address_line2 address_line3 address_street address_street_number
        address_street_number_suffix birth_date birth_name birth_name_prefix birth_place
        business_email business_fax business_mobile business_phone business_phone_extension
        caso_number city code country created creator creator_full_name customer custom_field
        division email employee_hid end_date first_name full_name gender hid initials is_active
        is_anonymised language last_name location_description manager marital_date marital_status
        middle_name mobile modified modifier modifier_full_name municipality name_composition
        nationality nick_name notes partner_name partner_name_prefix person phone phone_extension
        picture picture_file_name picture_thumbnail_url picture_url postcode private_email
        social_security_number start_date state title user user_full_name
      ]
    end
  end
end
