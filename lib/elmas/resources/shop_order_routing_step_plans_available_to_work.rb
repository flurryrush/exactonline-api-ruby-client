# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShopOrderRoutingStepPlansAvailableToWork
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class ShopOrderRoutingStepPlansAvailableToWork
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/manufacturing/ShopOrderRoutingStepPlansAvailableToWork"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadManufacturingShopOrderRoutingStepPlansAvailableToWork
    def other_attributes
      %i[
        routing_step customer_code customer_count customer_name data_type date_ascending_order
        date_descending_order extra_description is_fraction_allowed_item is_released
        is_run_operation_finished is_setup_operation_finished item item_code
        item_code_ascending_order item_code_descending_order item_description item_version
        item_version_notes line_number mode notes operation operation_code picture_thumbnail_path
        planned_date planned_quantity planned_setup_hours priority priority_descending_order
        project project_code project_description quantity_completed routing_step_description
        routing_step_realization_notes routing_step_status routing_step_status_description
        routing_step_type run_start_time run_status run_timed_time_transaction sales_order_count
        sales_order_line_number sales_order_number setup_percent_complete setup_start_time
        setup_status setup_timed_time_transaction shop_order shop_order_description
        shop_order_number shop_order_number_ascending_order shop_order_number_descending_order
        shop_order_status unit warehouse workcenter workcenter_code
      ]
    end
  end
end
