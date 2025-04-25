# frozen_string_literal: true

module Elmas
  # Endpoint
  # SerialNumber
  #
  # Good to know
  # Use this endpoint to read serial numbers.
  # A serial number is a number or code assigned to an individual item so that it can be uniquely identified.
  #  
  # Serial numbers are often used for warranty or servicing purposes.
  # For more information about the serial numbers functionality in Exact Online, see About serial and batch numbers
  #
  # Scope
  # Logistics items
  class SerialNumber
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "inventory/SerialNumbers"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventorySerialNumbers
    def other_attributes
      %i[
        available created creator creator_full_name custom_field division end_date is_blocked item
        item_code item_description modified modifier modifier_full_name remarks serial_number
        start_date storage_location storage_location_code storage_location_description warehouse
        warehouse_code warehouse_description
      ]
    end
  end
end
