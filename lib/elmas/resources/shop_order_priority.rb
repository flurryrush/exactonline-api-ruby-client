# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrderPriority
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing shopfloor
  class ShopOrderPriority
    include Elmas::Resource

    def valid_actions
      %i[get put]
    end

    def base_path
      "manufacturing/ShopOrderPriorities"
    end

    def mandatory_attributes
      %i[
        mode
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingShopOrderPriorities
    def other_attributes
      %i[
        division priority shop_order
      ]
    end
  end
end
