# frozen_string_literal: true

module Elmas
  # Endpoint
  # HoursByDate
  #
  # Good to know
  # Use this endpoint to read , filter and display all hour entries by employee based on the Date provided
  #
  # Scope
  # Projects billing
  class HoursByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HoursByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHoursByDate
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
