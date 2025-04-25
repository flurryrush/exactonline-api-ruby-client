# frozen_string_literal: true

module Elmas
  # Endpoint
  # BudgetScenario
  #
  # Good to know
  # 
  #
  # Scope
  # Financial budgets
  class BudgetScenario
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "beta/{division}/budget/BudgetScenarios"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BudgetBudgetScenarios
    def other_attributes
      %i[
        code created creator creator_full_name description division from_year modified modifier
        modifier_full_name to_year
      ]
    end
  end
end
