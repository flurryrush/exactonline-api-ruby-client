# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountItem
  #
  # Good to know
  # Use this endpoint to read division items.
  # Add CustomDescriptionLanguage='[ NL | FR-BE | NL-BE | .
  # .
  # .
  #  ]' to the header to retrieve language sensitive properties such as descriptions in a specific language.
  # This endpoint will return all the division items.
  #  Using the accountID as a filter will not have any effect on the result.
  # For more information about the Items functionality in Exact Online, see Working with items
  #
  # Scope
  # Logistics items
  class AccountItem
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/logistics/AccountItems"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadLogisticsAccountItems
    def other_attributes
      %i[
        account barcode code cost_price_currency cost_price_new cost_price_standard created
        creator creator_full_name default_sales_price description division end_date
        is_fraction_allowed_item is_sales_item is_stock_item is_taxable_item is_webshop_item
        item_group item_group_code item_group_description margin markup modified modifier
        modifier_full_name notes picture_name picture_thumbnail_url picture_url projected_stock
        purchase_lead_days quantity_to_be_consumed quantity_to_be_delivered quantity_to_be_produced
        quantity_to_be_received reserved_stock sales_currency sales_price sales_vat_code
        sales_vat_code_description start_date stock unit unit_code unit_description unit_type
      ]
    end
  end
end
