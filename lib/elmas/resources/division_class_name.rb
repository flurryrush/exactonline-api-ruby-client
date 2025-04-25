# frozen_string_literal: true

module Elmas
  # Endpoint
  # DivisionClassName
  #
  # Good to know
  # Company classifications can be used to search for or filter on a specific company.
  #  This end point returns a list of those classifications
  #
  # Scope
  # Organization administration
  class DivisionClassName
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/DivisionClassNames"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMDivisionClassNames
    def other_attributes
      %i[
        created creator creator_full_name customer description description_term_id modified
        modifier modifier_full_name sequence_nr
      ]
    end
  end
end
