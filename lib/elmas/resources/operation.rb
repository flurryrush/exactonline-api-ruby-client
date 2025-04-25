# frozen_string_literal: true

module Elmas
  # Endpoint
  # Operation
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class Operation
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/Operations"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingOperations
    def other_attributes
      %i[
        created creator creator_full_name division has_suppliers item item_description modified
        modifier modifier_full_name notes searchcode status
      ]
    end
  end
end
