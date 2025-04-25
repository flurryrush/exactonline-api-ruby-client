# frozen_string_literal: true

module Elmas
  # Endpoint
  # DivisionClassValue
  #
  # Good to know
  # This end point returns the values as used per company classification for a given company
  #
  # Scope
  # Organization administration
  class DivisionClassValue
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "hrm/DivisionClassValues"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=HRMDivisionClassValues
    def other_attributes
      %i[
        class_01 class_01_id class_02 class_02_id class_03 class_03_id class_04 class_04_id
        class_05 class_05_id created creator creator_full_name customer division modified modifier
        modifier_full_name
      ]
    end
  end
end
