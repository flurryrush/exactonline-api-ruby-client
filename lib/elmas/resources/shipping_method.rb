# frozen_string_literal: true

module Elmas
  # Endpoint
  # ShippingMethod
  #
  # Good to know
  # Use this endpoint to read Shipping Methods.
  # The current range of shipping methods is available to dispatch/receive sales/purchase orders.
  # For more information about the  functionality in Exact Online, see Overview | Shipping methods
  #
  # Scope
  # Sales orders
  class ShippingMethod
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sales/ShippingMethods"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesShippingMethods
    def other_attributes
      %i[
        active amount code created creator creator_full_name description division modified
        modifier modifier_full_name notes shipping_rates_url tracking_url vat_code
        vat_code_description vat_percentage
      ]
    end
  end
end
