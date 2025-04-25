# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryRecentActivitiesAndExpense
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Activites and Expenses together with its corresponding parent Deliverable used by an employee for hour and cost entries.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryRecentActivitiesAndExpense
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryRecentActivitiesAndExpenses"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryRecentActivitiesAndExpenses
    def other_attributes
      %i[
        date_last_used default_item default_item_code default_item_description description
        parent_description
      ]
    end
  end
end
