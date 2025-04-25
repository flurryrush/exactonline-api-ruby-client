# frozen_string_literal: true

module Elmas
  # Endpoint
  # Subscription
  #
  # Good to know
  # Use this endpoint to create, read, update and delete subscriptions.
  # Note: You must include a parameter for 'SubscriptionLines' to add subscription lines when you POST to the Subscriptions endpoint.
  #  This parameter is not necessary when you PUT to this endpoint.
  # For more information about the Subscription functionality in Exact Online, see About Subscriptions
  #
  # Scope
  # Sales contracts
  class Subscription
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "subscription/Subscriptions"
    end

    def mandatory_attributes
      %i[
        ordered_by subscription_lines subscription_type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SubscriptionSubscriptions
    def other_attributes
      %i[
        entry_id block_entry cancellation_date classification classification_code
        classification_description created creator creator_full_name currency customer_po_number
        description division end_date invoice_day invoiced_to invoice_to invoice_to_contact_person
        invoice_to_contact_person_full_name invoice_to_name invoicing_start_date modified modifier
        modifier_full_name notes number ordered_by_contact_person
        ordered_by_contact_person_full_name ordered_by_name payment_condition
        payment_condition_description printed project reason_cancelled reason_cancelled_code
        reason_cancelled_description start_date subscription_restriction_employees
        subscription_restriction_items subscription_type_code subscription_type_description
      ]
    end
  end
end
