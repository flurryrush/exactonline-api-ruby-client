# frozen_string_literal: true

module Elmas
  # Endpoint
  # Currency
  #
  # Good to know
  # Use this endpoint to get all the currencies enabled
  #
  # Scope
  # Financial currencies
  class Currency
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "general/Currencies"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=GeneralCurrencies
    def other_attributes
      %i[
        code amount_precision created description modified price_precision
      ]
    end
  end
end
