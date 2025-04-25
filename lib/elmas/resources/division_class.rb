# frozen_string_literal: true

module Elmas
  # Endpoint
  # DivisionClass
  #
  # Good to know
  # This end point returns the possible choices per classification for a given company
  #
  # Scope
  # Organization administration
  class DivisionClass
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/DivisionClasses"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMDivisionClasses
    def other_attributes
      %i[
        class_name_customer class_name_description class_name_id code created creator
        creator_full_name description description_term_id modified modifier modifier_full_name
        sequence_nr
      ]
    end
  end
end
