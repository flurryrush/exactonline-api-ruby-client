# frozen_string_literal: true

module Elmas
  # Endpoint
  # GeneralLayout
  #
  # Good to know
  # Use this endpoint to get all the layouts
  #
  # Scope
  # -
  class GeneralLayout
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "general/Layouts"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=GeneralLayouts
    def other_attributes
      %i[
        category category_name created creator creator_full_name dd_view division language
        modified modifier modifier_full_name status subject type
      ]
    end
  end
end
