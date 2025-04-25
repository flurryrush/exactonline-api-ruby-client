# frozen_string_literal: true

module Elmas
  # Endpoint
  # StartedTimedTimeTransaction
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class StartedTimedTimeTransaction
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/manufacturing/StartedTimedTimeTransactions"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadManufacturingStartedTimedTimeTransactions
    def other_attributes
      %i[
        created creator creator_full_name customer_code customer_count customer_name data_type
        division employee end_time is_fraction_allowed_item is_operation_finished item item_code
        item_picture_url item_unit labor_hours machine_hours modified modifier modifier_full_name
        notes operation operation_code percent_complete produced_quantity project project_code
        project_description sales_order_count sales_order_line_number sales_order_number shop_order
        shop_order_description shop_order_number shop_order_planned_quantity
        shop_order_routing_step_plan shop_order_routing_step_plan_attended_percentage
        shop_order_routing_step_plan_description source start_time status type warehouse workcenter
        workcenter_code workcenter_description
      ]
    end
  end
end
