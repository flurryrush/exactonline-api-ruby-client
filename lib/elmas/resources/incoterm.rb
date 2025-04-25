# frozen_string_literal: true

module Elmas
  # Endpoint
  # Incoterm
  #
  # Good to know
  # Use this endpoint to read incoterms.
  # Retrieve all available incoterms
  #
  # Scope
  # Crm quotes sales orders sales invoices purchase orders
  class Incoterm
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/Incoterms"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsIncoterms
    def other_attributes
      %i[
        code description version
      ]
    end
  end
end
