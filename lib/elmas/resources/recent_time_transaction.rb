# frozen_string_literal: true

module Elmas
  # Endpoint
  # RecentTimeTransaction
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class RecentTimeTransaction
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/manufacturing/RecentTimeTransactions"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadManufacturingRecentTimeTransactions
    def other_attributes
      %i[
        customer_code customer_count customer_name data_type date employee end_time hour_status
        is_fraction_allowed_item is_operation_finished item item_code item_picture_url item_unit
        labor_hours machine_hours modified notes operation operation_code percent_complete
        produced_quantity project project_code project_description sales_order_count
        sales_order_line_number sales_order_number shop_order shop_order_description
        shop_order_number shop_order_planned_quantity shop_order_routing_step_plan
        shop_order_routing_step_plan_attended_percentage shop_order_routing_step_plan_description
        start_time status type warehouse workcenter workcenter_code
      ]
    end
  end
end
