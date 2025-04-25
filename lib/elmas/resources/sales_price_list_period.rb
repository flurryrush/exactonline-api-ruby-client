# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesPriceListPeriod
  #
  # Good to know
  # Use this endpoint to :  retrieve the validity periods in price listsPrice lists allow you to manage price in different periods, with for each period different items or discounts.
  # Use the following related endpoints to retrieve details of prices lists :  SalesPriceLists  SalesPriceListLinkedAccounts  SalesPriceListVolumeDiscountsFor more information about the  functionality in Exact Online, see Sales price management
  #
  # Scope
  # Sales prices
  class SalesPriceListPeriod
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sales/SalesPriceListPeriods"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesSalesPriceListPeriods
    def other_attributes
      %i[
        created creator creator_full_name currency division end_date modified modifier
        modifier_full_name price_list start_date type
      ]
    end
  end
end
