# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingActivitiesAndExpense
  #
  # Good to know
  # Use this endpoint to retrieve a list of Activities, Expenses and its parent Deliverable
  #
  # Scope
  # Projects billing
  class TimeAndBillingActivitiesAndExpense
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingActivitiesAndExpenses"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingActivitiesAndExpenses
    def other_attributes
      %i[
        default_item default_item_code default_item_description description parent_description
      ]
    end
  end
end
