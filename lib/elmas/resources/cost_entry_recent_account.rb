# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostEntryRecentAccount
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Accounts used by an employee for cost entries.
  #  The list Is ordered by the most recently used first
  #
  # Scope
  # Projects projects
  class CostEntryRecentAccount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostEntryRecentAccounts"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostEntryRecentAccounts
    def other_attributes
      %i[
        account_id account_name date_last_used
      ]
    end
  end
end
