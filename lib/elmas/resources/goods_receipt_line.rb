# frozen_string_literal: true

module Elmas
  # Endpoint
  # GoodsReceiptLine
  #
  # Good to know
  # Use this endpoint to :  Create new goods receipt lines.
  #   Read existing goods receipt lines.
  #  Note: Goods receipt lines should not be posted individually.
  #  They should be part of the GoodsReceipts Post.
  #  For creating goods receipt lines, it is mandatory to supply PurchaseOrderLineID.
  #  If QuantityReceived is not supplied, then the count of the remaining quantity will be used.
  #  The received quantity cannot be greater than quantity to be received unless the company enables 'Receipt of more than ordered is allowed' setting.
  # For more information about the  functionality in Exact Online, see Goods receipts
  #
  # Scope
  # Logistics wms
  class GoodsReceiptLine
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "purchaseorder/GoodsReceiptLines"
    end

    def mandatory_attributes
      %i[
        purchase_order_line_id quantity_received
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseOrderGoodsReceiptLines
    def other_attributes
      %i[
        batch_numbers created creator creator_full_name description division expense
        expense_description goods_receipt_id item item_code item_description item_unit_code
        line_number location location_code location_description modified modifier
        modifier_full_name notes project project_code project_description purchase_order_id
        purchase_order_number quantity_ordered rebill serial_numbers supplier_item_code
      ]
    end
  end
end
