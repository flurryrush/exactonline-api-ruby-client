# frozen_string_literal: true

module Elmas
  # Endpoint
  # Complaint
  #
  # Good to know
  # 
  #
  # Scope
  # Organization workflow
  class Complaint
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "activities/Complaints"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ActivitiesComplaints
    def other_attributes
      %i[
        account account_name assigned_to assigned_to_full_name attachments complaint contact
        contact_full_name created creator creator_full_name division document document_subject hid
        modified modifier modifier_full_name next_action notes receipt_date status
        status_description
      ]
    end
  end
end
