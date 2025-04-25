# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostType
  #
  # Good to know
  # This endpoint enables users to retrieve up to date active Cost types
  #
  # Scope
  # Projects projects
  class CostType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostTypes
    def other_attributes
      %i[
        item_id item_code item_description
      ]
    end
  end
end
