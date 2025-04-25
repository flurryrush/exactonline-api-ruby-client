# frozen_string_literal: true

module Elmas
  # Endpoint
  # DeductibilityPercentage
  #
  # Good to know
  # Deductibility percentages change from time to time, use this endpoint to get all the Deductibility percentages of all the G/L account of an administration.
  # If there is an old Deductibility percentage linked to the G/L account, it will also be retrieved.
  #  To POST Deductibility percentages, please use GLAccounts endpoint
  #
  # Scope
  # Financial generalledgers
  class DeductibilityPercentage
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financial/DeductibilityPercentages"
    end

    def mandatory_attributes
      %i[
        gl_account
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialDeductibilityPercentages
    def other_attributes
      %i[
        created creator creator_full_name division end_date expense_non_deductible_percentage
        line_number modified modifier modifier_full_name private_use_percentage start_date
        vat_non_deductible_percentage
      ]
    end
  end
end
