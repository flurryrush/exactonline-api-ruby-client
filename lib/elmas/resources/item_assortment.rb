# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemAssortment
  #
  # Good to know
  # Use this endpoint to read item assortments.
  # Item assortments can be used to filter or to create reports.
  # For more information about the item assortments functionality in Exact Online, see Working with item assortments
  #
  # Scope
  # Logistics items
  class ItemAssortment
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/ItemAssortment"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsItemAssortment
    def other_attributes
      %i[
        code description division properties
      ]
    end
  end
end
