# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseReturnLine
  #
  # Good to know
  # Use this endpoint to :  Create a new purchase return line.
  # (Adding a new line to existing purchase return is not allowed)  Retrieve an existing purchase return line.
  #   Update an existing purchase return line Note: Purchase return lines should not be posted individually.
  #  They should be part of the PurchaseReturn Post.
  #  For creating purchase return lines, it is mandatory to supply PurchaseOrderLineID,ReturnQuantity and GoodsReceiptLineID.
  #  The returned quantity cannot be greater than quantity received
  #
  # Scope
  # Logistics wms
  class PurchaseReturnLine
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "purchaseorder/PurchaseReturnLines"
    end

    def mandatory_attributes
      %i[
        goods_receipt_line_id purchase_order_line_id return_quantity
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseOrderPurchaseReturnLines
    def other_attributes
      %i[
        batch_numbers create_credit created creator creator_full_name division entry_id expense
        expense_description item item_code item_description line_number location location_code
        location_description modified modifier modifier_full_name notes project project_code
        project_description purchase_order_number rebill receipt_number received_quantity
        return_reason_code_description return_reason_code_id serial_numbers supplier_item_code
        unit_code
      ]
    end
  end
end
