# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemDetailsByID
  #
  # Good to know
  # Use this endpoint to read Item Details.
  # Add CustomDescriptionLanguage='[ NL | FR-BE | NL-BE | .
  # .
  # .
  #  ]' to the header to retrieve language sensitive properties such as descriptions in a specific language.
  # Retrieve item details.
  # For more information about the Items functionality in Exact Online, see Working with items
  #
  # Scope
  # Logistics items
  class ItemDetailsByID
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/logistics/ItemDetailsByID"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadLogisticsItemDetailsByID
    def other_attributes
      %i[
        code description is_fraction_allowed_item is_sales_item sales_currency sales_price
      ]
    end
  end
end
