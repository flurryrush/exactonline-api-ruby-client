# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeAndBillingEntryProject
  #
  # Good to know
  # This endpoint enables users to retrieve project code and project description based on the project ID provided
  #
  # Scope
  # Projects billing
  class TimeAndBillingEntryProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/TimeAndBillingEntryProjects"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectTimeAndBillingEntryProjects
    def other_attributes
      %i[
        project_id project_code project_description
      ]
    end
  end
end
