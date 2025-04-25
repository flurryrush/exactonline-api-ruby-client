# frozen_string_literal: true

module Elmas
  # Endpoint
  # AvailableFeature
  #
  # Good to know
  # This end point shows all features that are available in the current licence
  #
  # Scope
  # Organization administration
  class AvailableFeature
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "system/AvailableFeatures"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SystemSystemAvailableFeatures
    def other_attributes
      %i[
        description
      ]
    end
  end
end
