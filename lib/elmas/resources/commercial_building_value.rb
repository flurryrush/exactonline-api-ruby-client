# frozen_string_literal: true

module Elmas
  # Endpoint
  # CommercialBuildingValue
  #
  # Good to know
  # Use this endpoint to get all information related to commercial buildings values
  #
  # Scope
  # Financial assets
  class CommercialBuildingValue
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "assets/CommercialBuildingValues"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AssetsCommercialBuildingValues
    def other_attributes
      %i[
        asset created creator creator_full_name division end_date line_number minimum_value
        modified modifier modifier_full_name property_value property_value_option start_date
      ]
    end
  end
end
