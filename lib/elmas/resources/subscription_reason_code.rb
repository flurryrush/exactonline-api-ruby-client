# frozen_string_literal: true

module Elmas
  # Endpoint
  # SubscriptionReasonCode
  #
  # Good to know
  # Use this endpoint to read information about the reasons for subscription cancellation
  #
  # Scope
  # Sales contracts
  class SubscriptionReasonCode
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "subscription/SubscriptionReasonCodes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SubscriptionSubscriptionReasonCodes
    def other_attributes
      %i[
        active code created creator creator_full_name custom_field description division modified
        modifier modifier_full_name notes
      ]
    end
  end
end
