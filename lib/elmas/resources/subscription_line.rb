# frozen_string_literal: true

module Elmas
  # Endpoint
  # SubscriptionLine
  #
  # Good to know
  # Use this endpoint to create, read, update and delete subscription lines.
  # Note: For creating a SubscriptionLines, it is mandatory to supply one or more EntryID and Item
  #
  # Scope
  # Sales contracts
  class SubscriptionLine
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "subscription/SubscriptionLines"
    end

    def mandatory_attributes
      %i[
        entry_id item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SubscriptionSubscriptionLines
    def other_attributes
      %i[
        amount_dc amount_fc costcenter costunit custom_field description discount division
        from_date item_description line_number line_type line_type_description modified net_price
        notes quantity subscription_number to_date unit_code unit_description unit_price
        vat_amount_fc vat_code vat_code_description
      ]
    end
  end
end
