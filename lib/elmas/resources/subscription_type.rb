# frozen_string_literal: true

module Elmas
  # Endpoint
  # SubscriptionType
  #
  # Good to know
  # Use this endpoint to retrieve the susbcription types information
  #
  # Scope
  # Sales contracts
  class SubscriptionType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "subscription/SubscriptionTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SubscriptionSubscriptionTypes
    def other_attributes
      %i[
        automatic_generate_invoice_days automatic_generate_invoice_description
        automatic_generate_invoice_type automatic_send_invoice_days automatic_send_invoice_method
        automatic_send_invoice_sender automatic_send_invoice_sender_mailbox
        automatic_send_invoice_type cancellation_period cancellation_period_unit code created
        creator creator_full_name custom_field description division enable_payment_link
        invoice_correction_method invoice_period invoice_period_unit manual_renewal_method modified
        modifier modifier_full_name notes prolongation_type renewal_cancellation_period
        renewal_cancellation_period_unit renewal_period renewal_period_unit subscription_period
        subscription_period_unit
      ]
    end
  end
end
