# frozen_string_literal: true

module Elmas
  # Endpoint
  # Task
  #
  # Good to know
  # 
  #
  # Scope
  # Organization workflow
  class Task
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "activities/Tasks"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ActivitiesTasks
    def other_attributes
      %i[
        account account_name action_date attachments contact contact_full_name created creator
        creator_full_name custom_task_type description division document document_subject employee
        hid modified modifier modifier_full_name notes opportunity opportunity_name project
        project_description status status_description task_type task_type_description user
        user_full_name
      ]
    end
  end
end
