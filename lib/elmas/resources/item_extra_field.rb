# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemExtraField
  #
  # Good to know
  # Use this endpoint to retrieve extra information store in item.
  #  This extra information could be defined and access via Item maintenance and Free field master data.
  # itemId and modified can be use for filter.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Logistics items
  class ItemExtraField
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/logistics/ItemExtraField"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadLogisticsItemExtraField
    def other_attributes
      %i[
        description item_id modified number value
      ]
    end
  end
end
