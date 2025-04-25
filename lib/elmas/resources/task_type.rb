# frozen_string_literal: true

module Elmas
  # Endpoint
  # TaskType
  #
  # Good to know
  # The task types are specific types defined by the user of the accountancy firm.
  # This resource shows the custom types defined within a company
  #
  # Scope
  # Accountancy practicemanagement
  class TaskType
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "accountancy/TaskTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AccountancyTaskTypes
    def other_attributes
      %i[
        created creator creator_full_name description description_term_id division modified
        modifier modifier_full_name
      ]
    end
  end
end
