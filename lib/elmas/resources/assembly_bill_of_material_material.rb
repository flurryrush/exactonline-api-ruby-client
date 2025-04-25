# frozen_string_literal: true

module Elmas
  # Endpoint
  # AssemblyBillOfMaterialMaterial
  #
  # Good to know
  # Use this endpoint to create, read, update and delete item bill of materials.
  # Batch quantity, AssembledLeadDays and UseExplosion are BOM header values
  #
  # Scope
  # Manufacturing production
  class AssemblyBillOfMaterialMaterial
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/AssemblyBillOfMaterialMaterials"
    end

    def mandatory_attributes
      %i[
        assembled_item part_item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryAssemblyBillOfMaterialMaterials
    def other_attributes
      %i[
        assembled_item_code assembled_item_description assembled_lead_days batch_quantity created
        creator division line_number modified modifier part_item_code part_item_description
        quantity quantity_batch update_cost_price use_explosion
      ]
    end
  end
end
