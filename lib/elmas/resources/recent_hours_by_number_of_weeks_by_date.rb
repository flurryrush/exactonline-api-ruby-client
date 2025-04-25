# frozen_string_literal: true

module Elmas
  # Endpoint
  # RecentHoursByNumberOfWeeksByDate
  #
  # Good to know
  # Use this endpoint to read hour entries in the last specified number of ISO weeks based on a reference date.
  # For time and billing project users to gather insight on the amount of hours based on status by the user per week ordered by a reference date, in turn aid in generate powerful reports.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Projects billing
  class RecentHoursByNumberOfWeeksByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/RecentHoursByNumberOfWeeksByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectRecentHoursByNumberOfWeeksByDate
    def other_attributes
      %i[
        account_code account_id account_name activity activity_description date entry_id
        hours_approved hours_approved_billable hours_draft hours_draft_billable hours_rejected
        hours_rejected_billable hours_submitted hours_submitted_billable item_code item_description
        item_id notes project_code project_description project_id week_number
      ]
    end
  end
end
