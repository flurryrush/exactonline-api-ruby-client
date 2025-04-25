# frozen_string_literal: true

module Elmas
  # Endpoint
  # CustomerItem
  #
  # Good to know
  # Use this endpoint to create, read, update and delete customer items.
  # In some cases companies need to adopt and use the item code of their customer.
  #  They need to easily communicate sales related transactions with their item code
  #
  # Scope
  # Logistics items
  class CustomerItem
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "logistics/CustomerItems"
    end

    def mandatory_attributes
      %i[
        account item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsCustomerItems
    def other_attributes
      %i[
        account_code account_name created creator creator_full_name customer_item_code division
        item_code item_description modified modifier modifier_full_name type
      ]
    end
  end
end
