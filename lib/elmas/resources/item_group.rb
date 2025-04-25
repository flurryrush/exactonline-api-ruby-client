# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemGroup
  #
  # Good to know
  # Use this endpoint to read item groups.
  # Item groups are used to organize items.
  # For more information about the item groups functionality in Exact Online, see Working with item groups
  #
  # Scope
  # Logistics items
  class ItemGroup
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/ItemGroups"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsItemGroups
    def other_attributes
      %i[
        code created creator creator_full_name description division gl_costs gl_costs_code
        gl_costs_description gl_costs_work_in_progress gl_costs_work_in_progress_code
        gl_costs_work_in_progress_description gl_purchase_account gl_purchase_account_code
        gl_purchase_account_description gl_purchase_price_difference
        gl_purchase_price_difference_code gl_purchase_price_difference_descr gl_revenue
        gl_revenue_code gl_revenue_description gl_revenue_work_in_progress
        gl_revenue_work_in_progress_code gl_revenue_work_in_progress_description gl_stock
        gl_stock_code gl_stock_description gl_stock_variance gl_stock_variance_code
        gl_stock_variance_description is_default modified modifier modifier_full_name notes
      ]
    end
  end
end
