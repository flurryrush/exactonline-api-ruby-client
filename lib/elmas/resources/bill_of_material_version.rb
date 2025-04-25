# frozen_string_literal: true

module Elmas
  # Endpoint
  # BillOfMaterialVersion
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class BillOfMaterialVersion
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/BillOfMaterialVersions"
    end

    def mandatory_attributes
      %i[
        description item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingBillOfMaterialVersions
    def other_attributes
      %i[
        batch_quantity cad_drawing_url calculated_cost_price created creator creator_full_name
        division is_default item_description modified modifier modifier_full_name notes
        order_lead_days production_lead_days status status_description type type_description
        version_date version_number
      ]
    end
  end
end
