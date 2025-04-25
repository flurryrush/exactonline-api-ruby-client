# frozen_string_literal: true

module Elmas
  # Endpoint
  # UserRole
  #
  # Good to know
  # This end point returns a list of roles per user
  #
  # Scope
  # Organization administration
  class UserRole
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "users/UserRoles"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=UsersUserRoles
    def other_attributes
      %i[
        created creator creator_full_name description end_date modified modifier
        modifier_full_name role role_level start_date user_id
      ]
    end
  end
end
