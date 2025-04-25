# frozen_string_literal: true

module Elmas
  # Endpoint
  # WebhookSubscription
  #
  # Good to know
  # Use this endpoint to subscribe your app to one or more webhook topics.
  # For more information about the functionality see Exact Online webhooks
  #
  # Scope
  # Organization administration
  class WebhookSubscription
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "webhooks/WebhookSubscriptions"
    end

    def mandatory_attributes
      %i[
        callback_url topic
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=WebhooksWebhookSubscriptions
    def other_attributes
      %i[
        client_id created creator creator_full_name description division user_id
      ]
    end
  end
end
