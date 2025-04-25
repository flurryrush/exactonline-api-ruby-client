# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesPriceListLinkedAccount
  #
  # Good to know
  # Use this endpoint to :  retrieve customers linked to the price listsPrice lists allow you to manage prices for different items and customers.
  # â¯You can link several customers to a price list, but each customer can only be linked to one price list at a time.
  # Use the following related endpoints to retrieve details of prices lists :  SalesPriceLists  SalesPriceListPeriods  SalesPriceListVolumeDiscountsFor more information about the  functionality in Exact Online, see Sales price management
  #
  # Scope
  # Sales prices
  class SalesPriceListLinkedAccount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sales/SalesPriceListLinkedAccounts"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesSalesPriceListLinkedAccounts
    def other_attributes
      %i[
        code created creator creator_full_name division modified modifier modifier_full_name name
        price_list
      ]
    end
  end
end
