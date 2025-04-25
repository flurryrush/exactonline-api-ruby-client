# frozen_string_literal: true

module Elmas
  # Endpoint
  # Event
  #
  # Good to know
  # 
  #
  # Scope
  # Organization workflow
  class Event
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "activities/Events"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ActivitiesEvents
    def other_attributes
      %i[
        account account_name attachments campaign campaign_description contact contact_full_name
        created creator creator_full_name description division document document_subject end_date
        hid modified modifier modifier_full_name notes opportunity opportunity_name project
        project_description start_date status status_description user user_full_name
      ]
    end
  end
end
