# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrderRoutingStepPlan
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing shopfloor
  class ShopOrderRoutingStepPlan
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/ShopOrderRoutingStepPlans"
    end

    def mandatory_attributes
      %i[
        operation shop_order
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingShopOrderRoutingStepPlans
    def other_attributes
      %i[
        account account_name account_number attended_percentage backflush cost_per_item created
        creator creator_full_name description division efficiency_percentage factor_type
        line_number modified modifier modifier_full_name notes operation_code operation_description
        operation_resource planned_end_date planned_run_hours planned_setup_hours
        planned_start_date planned_total_hours purchase_unit purchase_unit_factor
        purchase_unit_price_fc purchase_unit_quantity routing_step_type run run_method
        run_method_description setup setup_unit status status_description subcontracted_lead_days
        time_transactions total_cost_dc workcenter workcenter_code workcenter_description
      ]
    end
  end
end
