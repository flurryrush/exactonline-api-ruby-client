# frozen_string_literal: true

module Elmas
  # Endpoint
  # BillOfMaterialMaterial
  #
  # Good to know
  # Use this endpoint to create, read, update and delete materials in a bill of material version linked to a make item.
  # You must use previously created make Item, Bill of material version before creating any BillOfMaterialMaterials.
  # For more information on Bill of Materials in Exact Online, see Bill of materials | New BOMs and different versions
  #
  # Scope
  # Manufacturing production
  class BillOfMaterialMaterial
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/BillOfMaterialMaterials"
    end

    def mandatory_attributes
      %i[
        item_version part_item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingBillOfMaterialMaterials
    def other_attributes
      %i[
        average_cost backflush calculator_type cost_batch cost_center cost_center_description
        cost_unit cost_unit_description creator_full_name description detail_drawing division
        line_number net_weight net_weight_unit notes part_item_average_cost part_item_code
        part_item_cost_price_standard part_item_description quantity quantity_batch routing_step_id
        syscreated syscreator sysmodified sysmodifier type waste_percentage
      ]
    end
  end
end
