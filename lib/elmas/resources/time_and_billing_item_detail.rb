# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingItemDetail
  #
  # Good to know
  # This endpoint enables users to retrieve a list of Items with details
  #
  # Scope
  # Projects billing
  class TimeAndBillingItemDetail
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingItemDetails"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingItemDetails
    def other_attributes
      %i[
        code description is_fraction_allowed_item is_sales_item sales_currency sales_price
      ]
    end
  end
end
