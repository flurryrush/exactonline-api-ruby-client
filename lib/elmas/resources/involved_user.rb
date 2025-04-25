# frozen_string_literal: true

module Elmas
  # Endpoint
  # InvolvedUser
  #
  # Good to know
  # The involved users keeps track on all users which are involved for a certain client of the accountant.
  #  The involved user also shows the role that the user has for the involved client.
  #  This functionality is only available in a practice company
  #
  # Scope
  # Accountancy practicemanagement
  class InvolvedUser
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "accountancy/InvolvedUsers"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AccountancyInvolvedUsers
    def other_attributes
      %i[
        account account_city account_code account_is_supplier account_logo_thumbnail_url
        account_name account_status created creator creator_full_name division involved_user_role
        involved_user_role_description is_main_contact modified modifier modifier_full_name
        person_email person_phone person_phone_extension person_picture_thumbnail_url user
        user_full_name
      ]
    end
  end
end
