# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostEntryExpensesByProject
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Expenses and its parent Deliverable based on the project ID provided
  #
  # Scope
  # Projects projects
  class CostEntryExpensesByProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostEntryExpensesByProject"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostEntryExpensesByProject
    def other_attributes
      %i[
        default_item default_item_code default_item_description description parent_description
      ]
    end
  end
end
