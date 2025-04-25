# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourCostType
  #
  # Good to know
  # This endpoint enables users to retrieve up to date active Hour and Cost types
  #
  # Scope
  # Projects billing
  class HourCostType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourCostTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourCostTypes
    def other_attributes
      %i[
        item_id item_code item_description
      ]
    end
  end
end
