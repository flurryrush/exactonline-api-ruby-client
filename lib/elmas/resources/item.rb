# frozen_string_literal: true

module Elmas
  # Endpoint
  # Item
  #
  # Good to know
  # Use this endpoint to create, read, update and delete Items.
  # Add CustomDescriptionLanguage='[ NL | FR-BE | NL-BE | .
  # .
  # .
  #  ]' to the header to retrieve language sensitive properties such as descriptions in a specific language.
  # Items are used in sales, purchase orders, shop orders, and more.
  #  You can organise Items into item groups, assortments, storage locations, and warehouses.
  # For more information about the Items functionality in Exact Online, see Working with items
  #
  # Scope
  # Logistics items
  class Item
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "logistics/Items"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsItems
    def other_attributes
      %i[
        assembled_lead_days average_cost barcode batch_quantity class_01 class_02 class_03
        class_04 class_05 class_06 class_07 class_08 class_09 class_10 copy_remarks
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
        gross_weight is_batch_item is_batch_number_item is_fraction_allowed_item is_make_item
        is_new_contract is_on_demand_item is_package_item is_purchase_item
        is_registration_code_item is_sales_item is_serial_item is_serial_number_item is_stock_item
        is_subcontracted_item is_taxable_item is_time is_webshop_item item_group item_group_code
        item_group_description modified modifier modifier_full_name net_weight net_weight_unit
        notes picture picture_name picture_thumbnail_url picture_url sales_vat_code
        sales_vat_code_description search_code security_level standard_sales_price start_date
        statistical_code statistical_net_weight statistical_units statistical_value stock unit
        unit_description unit_type use_explosion
      ]
    end
  end
end
