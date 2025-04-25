# frozen_string_literal: true

module Elmas
  # Endpoint
  # TimeCorrection
  #
  # Good to know
  # Use this endpoint to create, read, update and delete time correction to correct final time entries that already invoiced
  #
  # Scope
  # Projects billing
  class TimeCorrection
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/TimeCorrections"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectTimeCorrections
    def other_attributes
      %i[
        created creator creator_full_name division modified modifier modifier_full_name notes
        original_entry_id quantity
      ]
    end
  end
end
