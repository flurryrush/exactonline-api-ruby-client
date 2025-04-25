# frozen_string_literal: true

module Elmas
  # Endpoint
  # PaymentCondition
  #
  # Good to know
  # Use this endpoint to retrieve or create payment conditions to be used by your invoices.
  #  For more information about payment condition, you can visit the following help file Payment Condition
  #
  # Scope
  # Financial cashflow
  class PaymentCondition
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "cashflow/PaymentConditions"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowPaymentConditions
    def other_attributes
      %i[
        created creator creator_full_name credit_management_scenario
        credit_management_scenario_code credit_management_scenario_description discount_calculation
        discount_payment_days discount_percentage division modified modifier modifier_full_name
        payment_days payment_discount_type payment_end_of_months payment_method percentage
        vat_calculation
      ]
    end
  end
end
