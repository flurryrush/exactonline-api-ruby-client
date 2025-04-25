# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncLogisticsItem
  #
  # Good to know
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
  # Note: This endpoint does not support query { $select=* } since there are a lot of properties in this endpoint.
  # 
  # 
  #
  # Scope
  # Logistics items
  class SyncLogisticsItem
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/Logistics/Items"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncLogisticsItems
    def other_attributes
      %i[
        timestamp assembled_lead_days average_cost barcode batch_quantity class_01 class_02
        class_03 class_04 class_05 class_06 class_07 class_08 class_09 class_10 copy_remarks
        cost_price_currency cost_price_new cost_price_standard created creator creator_full_name
        custom_field division end_date extra_description free_bool_field_01 free_bool_field_02
        free_bool_field_03 free_bool_field_04 free_bool_field_05 free_date_field_01
        free_date_field_02 free_date_field_03 free_date_field_04 free_date_field_05
        free_number_field_01 free_number_field_02 free_number_field_03 free_number_field_04
        free_number_field_05 free_number_field_06 free_number_field_07 free_number_field_08
        free_text_field_01 free_text_field_02 free_text_field_03 free_text_field_04
        free_text_field_05 free_text_field_06 free_text_field_07 free_text_field_08
        free_text_field_09 free_text_field_10 gl_costs gl_costs_code gl_costs_description
        gl_costs_work_in_progress gl_costs_work_in_progress_code
        gl_costs_work_in_progress_description gl_revenue gl_revenue_code gl_revenue_description
        gl_revenue_work_in_progress gl_revenue_work_in_progress_code
        gl_revenue_work_in_progress_description gl_stock gl_stock_code gl_stock_description
        gross_weight is_batch_item is_fraction_allowed_item is_make_item is_new_contract
        is_on_demand_item is_package_item is_purchase_item is_registration_code_item is_sales_item
        is_serial_item is_stock_item is_subcontracted_item is_taxable_item is_time is_webshop_item
        item_group item_group_code item_group_description modified modifier modifier_full_name
        net_weight net_weight_unit notes picture picture_name picture_thumbnail_url picture_url
        sales_vat_code sales_vat_code_description search_code security_level start_date
        statistical_code statistical_net_weight statistical_units statistical_value stock unit
        unit_description unit_type use_explosion
      ]
    end
  end
end
