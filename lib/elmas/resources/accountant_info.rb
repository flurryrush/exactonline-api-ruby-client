# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountantInfo
  #
  # Good to know
  # This end point shows info related to the accountant of the customer.
  #  If the customer is an accountant himself, the service will show the info of the customer
  #
  # Scope
  # Organization administration
  class AccountantInfo
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "system/AccountantInfo"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SystemSystemAccountantInfo
    def other_attributes
      %i[
        address_line1 address_line2 address_line3 city email is_accountant logo menu_logo_url name
        phone postcode website
      ]
    end
  end
end
