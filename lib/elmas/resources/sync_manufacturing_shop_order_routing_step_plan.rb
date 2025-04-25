# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncManufacturingShopOrderRoutingStepPlan
  #
  # Good to know
  # Any change in the ShopOrderRoutingStepPlans will lead to a new timestamp value.
  #  The API will return the data in the same API call.
  # 
  # The sync api's have the goal to keep the data between Exact Online and a 3rd party application the same.
  # 
  # The sync api's are all based on row versioning and because of that it is guaranteed to be unique.
  #  Every time an existing record is changed or a new record is inserted, the row versioning value is higher than the highest available value at that time.
  #  When retrieving records via these api's also a timestamp value is returned.
  #  The highest timestamp value of the records returned should be stored on client side.
  #  Next time records are retrieved, the timestamp value stored on client side should be provided as parameter.
  #  The api will then return only the new and changed records.
  #  Using this method is more reliable than using modified date, since it can happen that multiple records have the same modified date and therefore same record can be returned more than once.
  #  This will not happen when using timestamp.
  # 
  # The sync api's are also developed to give best performance when retrieving records.
  #  Because of performance and the intended purpose of the api's, only the timestamp field is allowed as parameter.
  # 
  # The single and bulk apiâs are designed for a different purpose.
  #  They provide ability to retrieve specific record or a set of records which meet certain conditions.
  # 
  # In case the division is moved to another database in Exact Online the timestamp values will be reset.
  #  Therefore, after a division is moved all data needs to be synchronized again in order to get the new timestamp values.
  #  To see if a division was moved, the /api/v1/{division}/system/Divisions can be used.
  #  The property DivisionMoveDate indicated at which date a division was moved and this date can be used to determine if it is needed to synchronize all data again.
  # 
  # The API has two important key fields, the Timestamp and the ID.
  #  The ID should be used to uniquely identify the record and will never change
  # .
  #  The Timestamp is used to get new or changed records in an efficient way and will change for every change made to the record.
  # 
  # The timestamp value returned has no relation with actual date or time.
  #  As such it cannot be converted to a date\time value.
  #  The timestamp is a rowversion value.
  # 
  # When you use the sync or delete api for the first time for a particular division, filter on timestamp greater than 1.
  # 
  # Or use the SyncTimestamp API to GET a timestamp from a certain date.
  # 
  # Note: This endpoint does not support query { $select=* } since there are a lot of properties in this endpoint.
  # 
  # This endpoint is available for the following packages:
  # • Manufacturing (All)
  # 
  #
  # Scope
  # Manufacturing shopfloor
  class SyncManufacturingShopOrderRoutingStepPlan
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/Manufacturing/ShopOrderRoutingStepPlans"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncManufacturingShopOrderRoutingStepPlans
    def other_attributes
      %i[
        timestamp account account_name account_number attended_percentage backflush cost_per_item
        created creator creator_full_name description division efficiency_percentage factor_type
        item_routing_step line_number modified modifier modifier_full_name notes operation
        operation_code operation_description operation_resource planned_end_date planned_run_hours
        planned_setup_hours planned_start_date planned_total_hours purchase_unit
        purchase_unit_factor purchase_unit_price_fc purchase_unit_quantity routing_step_type run
        run_method run_method_description setup setup_unit shop_order status status_description
        subcontracted_lead_days total_cost_dc workcenter workcenter_code workcenter_description
      ]
    end
  end
end
