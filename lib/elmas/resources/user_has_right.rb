# frozen_string_literal: true

module Elmas
  # Endpoint
  # UserHasRight
  #
  # Good to know
  # This function can be used to check whether the current user has rights for an action on a specific endpoint.
  #  The endpoint should have format 'service/endpoint', the action should be either GET, POST, PUT or DELETE.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Organization administration
  class UserHasRight
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "users/UserHasRights"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=UsersUserHasRights
    def other_attributes
      %i[
        
      ]
    end
  end
end
