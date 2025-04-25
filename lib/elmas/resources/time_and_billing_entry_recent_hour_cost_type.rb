# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryRecentHourCostType
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Items used by an employee for hour and cost entries.
  #  The list is ordered by the most recently used first
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryRecentHourCostType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryRecentHourCostTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryRecentHourCostTypes
    def other_attributes
      %i[
        item_id date_last_used is_valid item_code item_description
      ]
    end
  end
end
