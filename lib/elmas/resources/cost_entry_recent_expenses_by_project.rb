# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostEntryRecentExpensesByProject
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Expenses and its parent Deliverable used by an employee for cost entries based on the Project Id provided.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects projects
  class CostEntryRecentExpensesByProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostEntryRecentExpensesByProject"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostEntryRecentExpensesByProject
    def other_attributes
      %i[
        date_last_used default_item default_item_code default_item_description description
        parent_description
      ]
    end
  end
end
