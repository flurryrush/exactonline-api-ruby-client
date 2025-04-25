# frozen_string_literal: true

module Elmas
  # Endpoint
  # Address
  #
  # Good to know
  # When using the POST method, it is first checked whether the specified address already exists.
  #  If so, the ID property of the existing address is returned.
  #  Otherwise, the new address is created
  #
  # Scope
  # Crm accounts
  class Address
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "crm/Addresses"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAddresses
    def other_attributes
      %i[
        account account_is_supplier account_name address_line1 address_line2 address_line3 city
        contact contact_name country country_name created creator creator_full_name custom_field
        division fax free_bool_field_01 free_bool_field_02 free_bool_field_03 free_bool_field_04
        free_bool_field_05 free_date_field_01 free_date_field_02 free_date_field_03
        free_date_field_04 free_date_field_05 free_number_field_01 free_number_field_02
        free_number_field_03 free_number_field_04 free_number_field_05 free_text_field_01
        free_text_field_02 free_text_field_03 free_text_field_04 free_text_field_05 mailbox main
        modified modifier modifier_full_name nic_number notes phone phone_extension postcode source
        state state_description type warehouse warehouse_code warehouse_description
      ]
    end
  end
end
