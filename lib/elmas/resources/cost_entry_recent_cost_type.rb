# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostEntryRecentCostType
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Items used by an employee for cost entries.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects projects
  class CostEntryRecentCostType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostEntryRecentCostTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostEntryRecentCostTypes
    def other_attributes
      %i[
        item_id date_last_used is_valid item_code item_description
      ]
    end
  end
end
