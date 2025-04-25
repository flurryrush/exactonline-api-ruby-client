# frozen_string_literal: true

module Elmas
  # Endpoint
  # OfficialReturn
  #
  # Good to know
  # This service it is only to be used in Spain
  #
  # Scope
  # Financial returns
  class OfficialReturn
    include Elmas::Resource

    def valid_actions
      %i[get post]
    end

    def base_path
      "financial/OfficialReturns"
    end

    def mandatory_attributes
      %i[
        frequency period status type year
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialOfficialReturns
    def other_attributes
      %i[
        amount created creator creator_full_name description division document document_subject
        is_correction modified modifier modifier_full_name presentation_data presentation_date
        presentation_file presentation_file_name reference source type_description
      ]
    end
  end
end
