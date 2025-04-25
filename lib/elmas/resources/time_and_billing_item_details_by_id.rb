# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingItemDetailsByID
  #
  # Good to know
  # Use this endpoint to read an Item used in hour and cost entries with details based on the Item Id provided
  #
  # Scope
  # Projects billing
  class TimeAndBillingItemDetailsByID
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingItemDetailsByID"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingItemDetailsByID
    def other_attributes
      %i[
        code description is_fraction_allowed_item is_sales_item sales_currency sales_price
      ]
    end
  end
end
