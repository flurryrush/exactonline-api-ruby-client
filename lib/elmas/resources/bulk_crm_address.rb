# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkCRMAddress
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # Account, Contact, ID, Main, Type, Warehouse
  # 
  #
  # Scope
  # Crm accounts
  class BulkCRMAddress
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/CRM/Addresses"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkCRMAddresses
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
