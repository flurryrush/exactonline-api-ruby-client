# frozen_string_literal: true

module Elmas
  # Endpoint
  # JobTitle
  #
  # Good to know
  # Use this endpoint to read Job titles.
  # Job titles of employees are used in Employment organizations and Active employments.
  # For more information about the HRM functionality in Exact Online, see Working with job titles
  #
  # Scope
  # Hrm employees
  class JobTitle
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/JobTitles"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMJobTitles
    def other_attributes
      %i[
        code created creator creator_full_name description division job_code job_group
        job_group_code job_group_description job_level_from job_level_to modified modifier
        modifier_full_name notes
      ]
    end
  end
end
