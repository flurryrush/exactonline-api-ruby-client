# frozen_string_literal: true

module Elmas
  # Endpoint
  # SelectionCode
  #
  # Good to know
  # Use this endpoint to read selection codes.
  # Selection codes can be used for different reasons within your sales/manufacturing/purchase orders.
  # 
  #  The selection codes can be defined by the users themselves and are therefore very flexible in the way a customer uses it
  #
  # Scope
  # Sales orders
  class SelectionCode
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/SelectionCodes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsSelectionCodes
    def other_attributes
      %i[
        active code created creator creator_full_name description division modified modifier
        modifier_full_name notes
      ]
    end
  end
end
