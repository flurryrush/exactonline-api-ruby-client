# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesItemPrice
  #
  # Good to know
  # Use this endpoint to :  Create a new sales item price.
  #  It will be treated as 'Price Agreement' when an account is provided.
  #  If is not provided,
  # it will be treated as the usual sales price.
  #   Retrieve an existing sales item price.
  #   Update an existing sales item price.
  #   Delete an existing sales item price.
  # There are several ways of defining sales price of an item.
  #  You can manage prices according to different items and customers.
  # 
  # You can also create for seasonal offers within a specified period.
  # For more information about the sales price management functionality in Exact Online, see Sales price management
  #
  # Scope
  # Sales prices
  class SalesItemPrice
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "logistics/SalesItemPrices"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsSalesItemPrices
    def other_attributes
      %i[
        account account_name barcode created creator creator_full_name currency default_item_unit
        default_item_unit_description division employee end_date item item_code item_description
        modified modifier modifier_full_name number_of_items_per_unit price project
        project_description quantity start_date unit unit_description
      ]
    end
  end
end
