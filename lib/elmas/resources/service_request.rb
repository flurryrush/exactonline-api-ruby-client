# frozen_string_literal: true

module Elmas
  # Endpoint
  # ServiceRequest
  #
  # Good to know
  # 
  #
  # Scope
  # Organization workflow
  class ServiceRequest
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "activities/ServiceRequests"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ActivitiesServiceRequests
    def other_attributes
      %i[
        account account_name assigned_to assigned_to_full_name attachments contact
        contact_full_name created creator creator_full_name description division document
        document_subject hid modified modifier modifier_full_name next_action notes receipt_date
        status status_description
      ]
    end
  end
end
