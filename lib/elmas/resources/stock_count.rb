# frozen_string_literal: true

module Elmas
  # Endpoint
  # StockCount
  #
  # Good to know
  # Use this endpoint to :  Create a new stock count.
  #   Retrieve an existing stock count.
  #   Update the Description, GLaccount, Date of an existing draft stock count.
  #   Delete a draft stock count.
  # You can create the stock count either as a draft or as processed, by defining the status as 12 - Open or 21-Processed.
  #   If the user doesn't have the right to process stock count, they can only use status 12 - OpenA stock count is used in the warehouse to record counted quantities.
  #  For more information about the stock counts functionality in Exact Online, see Stock Count - New
  #
  # Scope
  # Logistics inventory
  class StockCount
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/StockCounts"
    end

    def mandatory_attributes
      %i[
        stock_count_date stock_count_lines warehouse
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryStockCounts
    def other_attributes
      %i[
        stock_count_id counted_by created creator creator_full_name description division
        entry_number modified modifier modifier_full_name offset_gl_inventory
        offset_gl_inventory_code offset_gl_inventory_description source status stock_count_number
        warehouse_code warehouse_description
      ]
    end
  end
end
