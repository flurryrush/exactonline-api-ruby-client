# frozen_string_literal: true

module Elmas
  # Endpoint
  # InvolvedUserRole
  #
  # Good to know
  # An involved user role represents a role which a user can have in an accountancy firm.
  #  This involved user role can be used to indicate the role that a user have for a certain client.
  #  This functionality is only available in a practice company
  #
  # Scope
  # Accountancy practicemanagement
  class InvolvedUserRole
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "accountancy/InvolvedUserRoles"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AccountancyInvolvedUserRoles
    def other_attributes
      %i[
        code created creator creator_full_name description description_term_id division modified
        modifier modifier_full_name
      ]
    end
  end
end
