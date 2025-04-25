# frozen_string_literal: true

module Elmas
  # Endpoint
  # Workcenter
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing shopfloor
  class Workcenter
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/Workcenters"
    end

    def mandatory_attributes
      %i[
        code description status type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingWorkcenters
    def other_attributes
      %i[
        capacity costcenter costcenter_description costunit costunit_description created creator
        creator_full_name division general_burden_rate is_labor_burden_percent labor_burden_rate
        machine_burden_rate modified modifier modifier_full_name notes production_area
        run_labor_rate search_code setup_labor_rate
      ]
    end
  end
end
