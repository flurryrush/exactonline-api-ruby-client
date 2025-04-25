# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemAssortmentProperty
  #
  # Good to know
  # Use this endpoint to read item assortment properties.
  # Item assortments can be used to filter or to create reports.
  # For more information about the item assortments functionality in Exact Online, see Working with item assortments
  #
  # Scope
  # Logistics items
  class ItemAssortmentProperty
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/ItemAssortmentProperty"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsItemAssortmentProperty
    def other_attributes
      %i[
        code description division item_assortment_code
      ]
    end
  end
end
