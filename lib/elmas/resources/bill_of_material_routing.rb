# frozen_string_literal: true

module Elmas
  # Endpoint
  # BillOfMaterialRouting
  #
  # Good to know
  # Use this endpoint to create, read, update and delete routings in a bill of material version linked to a make item.
  # For more information on Bill of Materials in Exact Online, see Bill of materials | New BOMs and different versions
  #
  # Scope
  # Manufacturing production
  class BillOfMaterialRouting
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/BillOfMaterialRoutings"
    end

    def mandatory_attributes
      %i[
        item_version operation
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingBillOfMaterialRoutings
    def other_attributes
      %i[
        account attended_percentage backflush cost_per_item created_by created_date
        creator_full_name currency division efficiency_percentage factor_type general_burden item
        line_number machine_burden modified_by modified_date modifier_full_name notes
        operation_description operation_resource purchase_unit purchase_unit_factor
        purchase_unit_price_fc purchase_unit_quantity rate_fc resource_description
        routing_step_type run run_labor run_labor_burden run_method setup setup_labor
        setup_labor_burden setup_unit subcontracted_lead_days total_cost_dc workcenter
      ]
    end
  end
end
