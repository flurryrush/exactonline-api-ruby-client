# frozen_string_literal: true

module Elmas
  # Endpoint
  # BatchNumber
  #
  # Good to know
  # Use this endpoint to read batch number.
  # A batch number is a number or code assigned to multiple items so the whole group can be identified.
  #  For example, if an item in 
  # a batch is faulty the other items in that batch can be found and checked.
  # For more information about the batch number functionality in Exact Online, see About serial and batch numbers
  #
  # Scope
  # Logistics items
  class BatchNumber
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "inventory/BatchNumbers"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryBatchNumbers
    def other_attributes
      %i[
        available_quantity batch_number created creator creator_full_name custom_field division
        expiry_date is_blocked item item_code item_description modified modifier modifier_full_name
        remarks storage_locations warehouses
      ]
    end
  end
end
