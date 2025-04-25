# frozen_string_literal: true

module Elmas
  # Endpoint
  # RecentCostsByNumberOfWeek
  #
  # Good to know
  # Use this endpoint to read cost entries in the last specified number of ISO weeks.
  # For time and billing project users to gather insight on the cost based on status by the user per week ordered by the most recent date, in turn aid in generate powerful reports
  #
  # Scope
  # Projects billing
  class RecentCostsByNumberOfWeek
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/RecentCostsByNumberOfWeeks"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectRecentCostsByNumberOfWeeks
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
