# frozen_string_literal: true

module Elmas
  # Endpoint
  # ExchangeRate
  #
  # Good to know
  # Use this endpoint to create, update, view and delete exchange rates.
  #  The exchange rate of a foreign currency is defined related to the default currency of the company.
  #  Example: 1 EUR = XXX,XX in foreign currency (source currency).
  #  
  #
  # Scope
  # Financial currencies
  class ExchangeRate
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "financial/ExchangeRates"
    end

    def mandatory_attributes
      %i[
        source_currency
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialExchangeRates
    def other_attributes
      %i[
        created creator creator_full_name division modified modifier modifier_full_name rate
        source_currency_description start_date target_currency target_currency_description
      ]
    end
  end
end
