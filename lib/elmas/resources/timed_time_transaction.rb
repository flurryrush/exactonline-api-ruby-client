# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimedTimeTransaction
  #
  # Good to know
  # This endpoint enables user to start, stop and delete an operation for a shop order
  #
  # Scope
  # Manufacturing shopfloor
  class TimedTimeTransaction
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/TimedTimeTransactions"
    end

    def mandatory_attributes
      %i[
        employee shop_order_routing_step_plan
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingTimedTimeTransactions
    def other_attributes
      %i[
        created creator creator_full_name division employee_full_name end_time
        is_operation_finished labor_hours machine_hours modified modifier modifier_full_name notes
        operation operation_code operation_description percent_complete produced_quantity
        production_area production_area_code production_area_description shop_order
        shop_order_description shop_order_number shop_order_routing_step_plan_description
        shop_order_routing_step_plan_remaining_run_hours
        shop_order_routing_step_plan_remaining_setup_hours source start_time status type workcenter
        workcenter_code workcenter_description
      ]
    end
  end
end
