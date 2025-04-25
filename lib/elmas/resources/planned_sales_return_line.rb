# frozen_string_literal: true

module Elmas
  # Endpoint
  # PlannedSalesReturnLine
  #
  # Good to know
  # Use this endpoint to :  Create a new planned sales return line.
  # (Adding a new line to existing planned sales return is not allowed)  Retrieve an existing planned sales return line.
  #   Update the draft planned sales return's planned quantity, receive quantity, storage location and the return option.
  #   Delete a draft planned sales return line.
  # For more information about the planned sales return line functionality in Exact Online, see Sales Return
  #
  # Scope
  # Sales orders
  class PlannedSalesReturnLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesorder/PlannedSalesReturnLines"
    end

    def mandatory_attributes
      %i[
        create_credit good_delivery_line_id item planned_return_quantity received_quantity
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderPlannedSalesReturnLines
    def other_attributes
      %i[
        batch_numbers created creator creator_full_name division item_code item_description
        line_number modified modifier modifier_full_name notes planned_sales_return_id
        return_reason_code_code return_reason_code_description return_reason_code_id
        sales_order_line_id sales_order_number serial_numbers stock_transaction_entry_id
        storage_location storage_location_code storage_location_description
        storage_location_sequence_number unit_code unit_description
      ]
    end
  end
end
