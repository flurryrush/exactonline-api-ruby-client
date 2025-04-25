# frozen_string_literal: true

module Elmas
  # Endpoint
  # ReadSalesItemPrice
  #
  # Good to know
  # Use this endpoint to read price of sales item.
  # Add CustomDescriptionLanguage='[ NL | FR-BE | NL-BE | .
  # .
  # .
  #  ]' to the header to retrieve language sensitive properties such as descriptions in a specific language.
  # This endpoint retrieves the sales price of an item for an account based on the specified date.
  # 
  # Price agreement will take precedence over Price List (Pricelist functionality is checked) and if both do not exist, 
  # it will search for the usual sales prices defined.
  # For more information about the sales price management functionality in Exact Online, see Sales price management.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Sales prices
  class ReadSalesItemPrice
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/logistics/SalesItemPrice"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadLogisticsSalesItemPrice
    def other_attributes
      %i[
        currency_code item_code item_description item_id price_excluding_vat price_including_vat
        unit_code unit_description vat_code
      ]
    end
  end
end
