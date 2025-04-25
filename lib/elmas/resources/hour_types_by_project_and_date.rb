# frozen_string_literal: true

module Elmas
  # Endpoint
  # HourTypesByProjectAndDate
  #
  # Good to know
  # Use this endpoint to read active hour types by providing project id and a reference check date.
  # Note: Employee Id parameter is optional.
  #  Hour types listed will be based on a hierachy with project employee hour type restriction, project hour type restriction and employee restriction by providing this additional parameter.
  #  For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Projects billing
  class HourTypesByProjectAndDate
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/HourTypesByProjectAndDate"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectHourTypesByProjectAndDate
    def other_attributes
      %i[
        item_id item_code item_description
      ]
    end
  end
end
