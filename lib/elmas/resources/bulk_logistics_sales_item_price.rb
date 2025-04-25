# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkLogisticsSalesItemPrice
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # Account, EndDate, ID, Item, Price, Quantity, StartDate, Unit
  # 
  #
  # Scope
  # Sales prices
  class BulkLogisticsSalesItemPrice
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/Logistics/SalesItemPrices"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkLogisticsSalesItemPrices
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
