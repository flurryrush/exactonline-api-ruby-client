# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesPriceList
  #
  # Good to know
  # Use this endpoint to :  read basic information in price lists.
  #  Price lists allow you to manage prices  for different items and customers.
  #  Once created, these prices take effect for sales orders, and sales invoices, sales quotations.
  #   Use the following related endpoints to retrieve details of prices lists :  SalesPriceListLinkedAccounts  SalesPriceListPeriods  SalesPriceListVolumeDiscounts API relationships: For more information about the  functionality in Exact Online, see Sales price management
  #
  # Scope
  # Sales prices
  class SalesPriceList
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sales/SalesPriceLists"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesSalesPriceLists
    def other_attributes
      %i[
        code created creator creator_full_name currency description division entity modified
        modifier modifier_full_name notes type
      ]
    end
  end
end
