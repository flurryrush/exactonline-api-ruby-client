# frozen_string_literal: true

module Elmas
  # Endpoint
  # Unit
  #
  # Good to know
  # Use this endpoint to read units.
  # A unit shows how and in what quantity you sell an item.
  # For more information about the units functionality in Exact Online, see Working with units
  #
  # Scope
  # Logistics items
  class Unit
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/Units"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsUnits
    def other_attributes
      %i[
        active code description division main time_unit type
      ]
    end
  end
end
