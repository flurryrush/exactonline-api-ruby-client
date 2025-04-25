# frozen_string_literal: true

module Elmas
  # Endpoint
  # GoodsReceipt
  #
  # Good to know
  # Use this endpoint to :  Create new goods receipts.
  #   Read existing goods receipts.
  #   Update existing goods receipts.
  #  Note: For creating a GoodsReceipts, it is mandatory to supply one or more GoodReceiptLines and ReceiptDate.
  # For more information about the  functionality in Exact Online, see Goods receipts
  #
  # Scope
  # Logistics wms
  class GoodsReceipt
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "purchaseorder/GoodsReceipts"
    end

    def mandatory_attributes
      %i[
        goods_receipt_lines receipt_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseOrderGoodsReceipts
    def other_attributes
      %i[
        created creator creator_full_name description division document document_subject
        entry_number goods_receipt_line_count modified modifier modifier_full_name receipt_number
        remarks supplier supplier_code supplier_contact supplier_contact_full_name supplier_name
        warehouse warehouse_code warehouse_description your_ref
      ]
    end
  end
end
