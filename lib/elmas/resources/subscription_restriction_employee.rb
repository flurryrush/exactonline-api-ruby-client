# frozen_string_literal: true

module Elmas
  # Endpoint
  # SubscriptionRestrictionEmployee
  #
  # Good to know
  # Use this endpoint to restrict which employee is able to enter time/cost entries on the subscription.
  # Note: For creating subscription restriction employee, it is mandatory to supply Employee Id and Subscription Id
  #
  # Scope
  # Sales contracts
  class SubscriptionRestrictionEmployee
    include Elmas::Resource

    def valid_actions
      %i[get post delete]
    end

    def base_path
      "subscription/SubscriptionRestrictionEmployees"
    end

    def mandatory_attributes
      %i[
        employee subscription
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SubscriptionSubscriptionRestrictionEmployees
    def other_attributes
      %i[
        created creator creator_full_name division employee_full_name employee_hid modified
        modifier modifier_full_name subscription_description subscription_number
      ]
    end
  end
end
