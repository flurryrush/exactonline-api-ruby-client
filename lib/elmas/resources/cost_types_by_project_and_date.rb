# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostTypesByProjectAndDate
  #
  # Good to know
  # This endpoint enables users to retrieve active Cost types based on Project and date provided.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Projects projects
  class CostTypesByProjectAndDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostTypesByProjectAndDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostTypesByProjectAndDate
    def other_attributes
      %i[
        item_id item_code item_description
      ]
    end
  end
end
