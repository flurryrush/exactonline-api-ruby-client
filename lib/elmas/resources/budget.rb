# frozen_string_literal: true

module Elmas
  # Endpoint
  # Budget
  #
  # Good to know
  # Use this endpoint to get the budgets that you have allocated to a G/L account in your administration.
  #  For more information about budget, you can refer to Budgets
  #
  # Scope
  # Financial budgets
  class Budget
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "budget/Budgets"
    end

    def mandatory_attributes
      %i[
        amount_dc
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BudgetBudgets
    def other_attributes
      %i[
        budget_scenario budget_scenario_code budget_scenario_description costcenter
        costcenter_description costunit costunit_description created creator creator_full_name
        division gl_account gl_account_code gl_account_description hid item item_code
        item_description modified modifier modifier_full_name reporting_period reporting_year
      ]
    end
  end
end
