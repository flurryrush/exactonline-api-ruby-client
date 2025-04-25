# frozen_string_literal: true

module Elmas
  # Endpoint
  # Costunit
  #
  # Good to know
  # Use this endpoint to create, read, update and delete Cost units.
  # The code can only be changed in Exact Online by using the recode function.
  # For more information about the Cost analysis functionality in Exact Online, see Working with cost centres and cost units
  #
  # Scope
  # Financial costcenters
  class Costunit
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "hrm/Costunits"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMCostunits
    def other_attributes
      %i[
        created creator creator_full_name custom_field division end_date modified modifier
        modifier_full_name
      ]
    end
  end
end
