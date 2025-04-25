# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectRestrictionRebilling
  #
  # Good to know
  # This endpoint enables users to restrict which cost types the project allows rebilling to customer
  #
  # Scope
  # Projects billing
  class ProjectRestrictionRebilling
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectRestrictionRebillings"
    end

    def mandatory_attributes
      %i[
        cost_type_rebill project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectRestrictionRebillings
    def other_attributes
      %i[
        cost_type_rebill_code cost_type_rebill_description created creator creator_full_name
        division modified modifier modifier_full_name project_code project_description
      ]
    end
  end
end
