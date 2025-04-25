# frozen_string_literal: true

module Elmas
  # Endpoint
  # StageForDeliveryReceipt
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class StageForDeliveryReceipt
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "manufacturing/StageForDeliveryReceipts"
    end

    def mandatory_attributes
      %i[
        quantity shop_order transaction_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingStageForDeliveryReceipts
    def other_attributes
      %i[
        created_by created_by_full_name created_date has_reversible_quantity is_batch
        is_fraction_allowed_item is_serial item item_code item_description item_picture_url
        related_id shop_order_number unit unit_description warehouse warehouse_code
        warehouse_description
      ]
    end
  end
end
