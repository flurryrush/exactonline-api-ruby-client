# frozen_string_literal: true

module Elmas
  # Endpoint
  # RecentCostsByNumberOfWeeksByDate
  #
  # Good to know
  # Use this endpoint to read cost entries in the last specified number of ISO weeks based on a reference date.
  # For time and billing project users to gather insight on the cost based on status by the user per week ordered by a reference date, in turn aid in generate powerful reports.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Projects billing
  class RecentCostsByNumberOfWeeksByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/RecentCostsByNumberOfWeeksByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectRecentCostsByNumberOfWeeksByDate
    def other_attributes
      %i[
        account_code account_id account_name amount_approved amount_draft amount_rejected
        amount_submitted currency_code date entry_id expense expense_description item_code
        item_description item_id notes project_code project_description project_id
        quantity_approved quantity_draft quantity_rejected quantity_submitted week_number
      ]
    end
  end
end
