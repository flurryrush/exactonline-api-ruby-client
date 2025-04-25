# frozen_string_literal: true

module Elmas
  # Endpoint
  # CommunicationNote
  #
  # Good to know
  # 
  #
  # Scope
  # Organization workflow
  class CommunicationNote
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "activities/CommunicationNotes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ActivitiesCommunicationNotes
    def other_attributes
      %i[
        account account_name attachments campaign campaign_description contact contact_full_name
        created creator creator_full_name date division document document_subject hid modified
        modifier modifier_full_name notes opportunity opportunity_name status status_description
        subject user user_full_name
      ]
    end
  end
end
