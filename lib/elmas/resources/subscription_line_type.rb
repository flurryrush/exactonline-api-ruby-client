# frozen_string_literal: true

module Elmas
  # Endpoint
  # SubscriptionLineType
  #
  # Good to know
  # This endpoint enables users to retrieve the types of subscription lines
  #
  # Scope
  # Sales contracts
  class SubscriptionLineType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "subscription/SubscriptionLineTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SubscriptionSubscriptionLineTypes
    def other_attributes
      %i[
        description
      ]
    end
  end
end
