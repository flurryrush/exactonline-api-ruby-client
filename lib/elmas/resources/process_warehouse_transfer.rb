# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProcessWarehouseTransfer
  #
  # Good to know
  # Use this endpoint to process existing draft warehouse transfer.
  # To use this endpoint please take note that: 
  # - For professional and premium package, if warehouse is using storage location, please make sure location assigned to all lines 
  # - Process warehouse transfer only support normal items, serial and batch item is not supportedFor more information about the warehouse transfer functionality in Exact Online, see Warehouse Transfer - New
  #
  # Scope
  # Logistics inventory
  class ProcessWarehouseTransfer
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "inventory/ProcessWarehouseTransfer"
    end

    def mandatory_attributes
      %i[
        transfer_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryProcessWarehouseTransfer
    def other_attributes
      %i[
        division transfer_date
      ]
    end
  end
end
