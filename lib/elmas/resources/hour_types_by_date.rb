# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourTypesByDate
  #
  # Good to know
  # This endpoint enables users to retrieve active Hour types based on date provided
  #
  # Scope
  # Projects billing
  class HourTypesByDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourTypesByDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourTypesByDate
    def other_attributes
      %i[
        item_id item_code item_description
      ]
    end
  end
end
