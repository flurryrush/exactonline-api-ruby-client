# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostTypesByDate
  #
  # Good to know
  # This endpoint enables users to retrieve active Cost types based on date provided
  #
  # Scope
  # Projects projects
  class CostTypesByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostTypesByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostTypesByDate
    def other_attributes
      %i[
        item_id item_code item_description
      ]
    end
  end
end
