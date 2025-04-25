# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourType
  #
  # Good to know
  # This endpoint enables users to retrieve up to date active Hour types
  #
  # Scope
  # Projects billing
  class HourType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourTypes
    def other_attributes
      %i[
        item_id item_code item_description
      ]
    end
  end
end
