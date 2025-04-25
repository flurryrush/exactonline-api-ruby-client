# frozen_string_literal: true

module Elmas
  # Endpoint
  # ManufacturingSetting
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class ManufacturingSetting
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "manufacturing/ManufacturingSettings"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingManufacturingSettings
    def other_attributes
      %i[
        division inventory_main_method inventory_sub_method negative_stock_is_allowed
        serial_numbers_are_mandatory show_backflush_materials show_sub_order_materials
      ]
    end
  end
end
