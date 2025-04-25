# frozen_string_literal: true

module Elmas
  # Endpoint
  # Bank
  #
  # Good to know
  # Use this endpoint to get all the banks that are supported by EOL
  #
  # Scope
  # Financial cashflow
  class Bank
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "cashflow/Banks"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowBanks
    def other_attributes
      %i[
        bank_name bic_code country created description format home_page_address modified status
      ]
    end
  end
end
