# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectBudgetType
  #
  # Good to know
  # This endpoint enables users to retrieve a list of project budget types
  #
  # Scope
  # Projects projects
  class ProjectBudgetType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "project/ProjectBudgetTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectBudgetTypes
    def other_attributes
      %i[
        description
      ]
    end
  end
end
