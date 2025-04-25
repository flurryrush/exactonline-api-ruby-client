# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesPriceListVolumeDiscount
  #
  # Good to know
  # Use this endpoint to :  Get discountsPrice lists allow you to manage prices for different items and customers.
  # â¯You can link several customers to a price list, but each customer can only be linked to one price list at a time.
  # Use the following related endpoints to retrieve details of prices lists :  SalesPriceLists  SalesPriceListPeriods  SalesPriceListLinkedAccounts For more information about the  functionality in Exact Online, see Sales price management
  #
  # Scope
  # Sales prices
  class SalesPriceListVolumeDiscount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sales/SalesPriceListVolumeDiscounts"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesSalesPriceListVolumeDiscounts
    def other_attributes
      %i[
        base_price base_price_amount created creator creator_full_name discount division
        entry_method item item_code item_description item_group item_group_code
        item_group_description modified modifier modifier_full_name new_price
        number_of_items_per_unit price_list_code price_list_description price_list_period quantity
        sales_unit unit unit_description
      ]
    end
  end
end
