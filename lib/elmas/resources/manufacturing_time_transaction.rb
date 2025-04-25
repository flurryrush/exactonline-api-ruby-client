# frozen_string_literal: true

module Elmas
  # Endpoint
  # ManufacturingTimeTransaction
  #
  # Good to know
  # This endpoint enables users to maintain time entries.
  #  Time entries cannot be approved using this endpoint
  #
  # Scope
  # Manufacturing shopfloor
  class ManufacturingTimeTransaction
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/TimeTransactions"
    end

    def mandatory_attributes
      %i[
        employee hours
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingTimeTransactions
    def other_attributes
      %i[
        activity created creator creator_full_name date division is_operation_finished labor_hours
        modified modifier modifier_full_name notes percent_complete quantity routing_step_plan
        shop_order status timed_time_transaction work_center
      ]
    end
  end
end
