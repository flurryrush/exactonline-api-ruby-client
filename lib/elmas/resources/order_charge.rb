# frozen_string_literal: true

module Elmas
  # Endpoint
  # OrderCharge
  #
  # Good to know
  # Use this endpoint to read Order Charges
  #
  # Scope
  # Sales orders
  class OrderCharge
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sales/OrderCharges"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderCharges
    def other_attributes
      %i[
        active amount code created creator creator_full_name description division gl_account
        gl_account_code gl_account_description modified modifier modifier_full_name vat_code
        vat_description vat_percentage
      ]
    end
  end
end
