# frozen_string_literal: true

module Elmas
  # Endpoint
  # SubscriptionRestrictionItem
  #
  # Good to know
  # Use this endpoint to restrict which hour/cost types can be used in time/cost entries for the subscription.
  # Note: For creating subscription restriction item, it is mandatory to supply Subscription Id
  #
  # Scope
  # Sales contracts
  class SubscriptionRestrictionItem
    include Elmas::Resource

    def valid_actions
      %i[get post delete]
    end

    def base_path
      "subscription/SubscriptionRestrictionItems"
    end

    def mandatory_attributes
      %i[
        subscription
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SubscriptionSubscriptionRestrictionItems
    def other_attributes
      %i[
        created creator creator_full_name division item item_code item_description modified
        modifier modifier_full_name subscription_description subscription_number
      ]
    end
  end
end
