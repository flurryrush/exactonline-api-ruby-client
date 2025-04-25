# frozen_string_literal: true

module Elmas
  # Endpoint
  # StockCountLine
  #
  # Good to know
  # Use this endpoint to :  Create a new line for an item that is already existing in a draft stock count.
  # 
  # (Adding multiple lines for one item in a stock count is for counting in multiple storage locations per item).
  #   Retrieve an existing stock count line.
  #   Update the line Quantity Difference or Quantity New of an existing draft stock count.
  #   Delete a line from a draft stock count.
  # When doing a POST,PUT for a stock count line, specify either
  # QuantityDifference or QuantityNew.
  #  When both properties are specified, QuantityDifference will be used.
  # 
  # When doing a PUT with reduced QuantityDifference or QuantityNew, stock count line will remove binded serial batch number records.
  # A stock count line is used inside a stock count to determine the difference in quantity or the new quantity of an item.
  # For more information about the stock count lines functionality in Exact Online, see Stock Count - New
  #
  # Scope
  # Logistics inventory
  class StockCountLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/StockCountLines"
    end

    def mandatory_attributes
      %i[
        item stock_count_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryStockCountLines
    def other_attributes
      %i[
        batch_numbers cost_price counted_by created creator creator_full_name division
        item_barcode item_code item_cost_price item_description item_divisable line_number modified
        modifier modifier_full_name quantity_difference quantity_in_stock quantity_new reason_code
        reason_code_description reason_code_id serial_numbers source status stock_keeping_unit
        storage_location storage_location_code storage_location_description
        storage_location_sequence_number warehouse
      ]
    end
  end
end
