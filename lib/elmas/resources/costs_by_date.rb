# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostsByDate
  #
  # Good to know
  # Use this endpoint to read , filter and display all cost entries by employee based on the Date provided
  #
  # Scope
  # Projects projects
  class CostsByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/CostsByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectCostsByDate
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
