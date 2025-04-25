# frozen_string_literal: true

module Elmas
  # Endpoint
  # AssemblyBillOfMaterialHeader
  #
  # Good to know
  # Use this endpoint to create, read, update and delete item bill of material's header
  #
  # Scope
  # Manufacturing production
  class AssemblyBillOfMaterialHeader
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "inventory/AssemblyBillOfMaterialHeader"
    end

    def mandatory_attributes
      %i[
        assembly_bill_of_material_materials
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=InventoryAssemblyBillOfMaterialHeader
    def other_attributes
      %i[
        assembled_lead_days batch_quantity code cost_price created creator creator_full_name
        description division modified modifier modifier_full_name notes update_cost_price
        use_explosion
      ]
    end
  end
end
