# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProductionArea
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class ProductionArea
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/ProductionAreas"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingProductionAreas
    def other_attributes
      %i[
        costcenter costcenter_description costunit costunit_description created creator
        creator_full_name division is_default modified modifier modifier_full_name notes
      ]
    end
  end
end
