# frozen_string_literal: true

module Elmas
  # Endpoint
  # UserRolesPerDivision
  #
  # Good to know
  # This end point returns a list of roles per user for a given company
  #
  # Scope
  # Organization administration
  class UserRolesPerDivision
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "users/UserRolesPerDivision"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=UsersUserRolesPerDivision
    def other_attributes
      %i[
        created creator creator_full_name description division end_date modified modifier
        modifier_full_name role role_level start_date user_id
      ]
    end
  end
end
