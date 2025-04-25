# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectAccountMutation
  #
  # Good to know
  # Use this endpoint to create, read, update and delete project account mutations.
  # Note: This endpoint only allow user to create last record and user is not allow to create record in between lines.
  #  For POST it is mandatory to provide Account, Project and StartDate
  #
  # Scope
  # Projects projects
  class ProjectAccountMutation
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/ProjectAccountMutations"
    end

    def mandatory_attributes
      %i[
        account project start_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjectAccountMutations
    def other_attributes
      %i[
        account_code account_name created creator creator_full_name division division_name
        end_date modified modifier modifier_full_name notes project_code project_description
      ]
    end
  end
end
