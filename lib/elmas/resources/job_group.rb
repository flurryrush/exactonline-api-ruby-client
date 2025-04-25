# frozen_string_literal: true

module Elmas
  # Endpoint
  # JobGroup
  #
  # Good to know
  # Use this endpoint to read Job groups.
  # Job groups are used to group Job titles.
  # For more information about the HRM functionality in Exact Online, see Working with job groups
  #
  # Scope
  # Hrm employees
  class JobGroup
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/JobGroups"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMJobGroups
    def other_attributes
      %i[
        code created creator creator_full_name description division modified modifier
        modifier_full_name notes
      ]
    end
  end
end
