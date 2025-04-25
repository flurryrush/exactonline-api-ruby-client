# frozen_string_literal: true

module Elmas
  # Endpoint
  # DepreciationMethod
  #
  # Good to know
  # Use this endpoint to get all information related to the depreciation methods of the administration.
  #  You can also use this endpoint to create, modify or delete a depreciation method.
  #  
  #
  # Scope
  # Financial assets
  class DepreciationMethod
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "assets/DepreciationMethods"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AssetsDepreciationMethods
    def other_attributes
      %i[
        amount created creator creator_full_name depreciation_interval division max_percentage
        modified modifier modifier_full_name percentage percentage2 periods type type_description
        years
      ]
    end
  end
end
