# frozen_string_literal: true

module Elmas
  # Endpoint
  # JournalStatusList
  #
  # Good to know
  # This resource will provide you information on the status of a Journal in a certain period.
  #  Are you interested in when a status of a Journal changes? You can get notifications via webhooks
  #
  # Scope
  # Financial accounting
  class JournalStatusList
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/JournalStatusList"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialJournalStatusList
    def other_attributes
      %i[
        journal period year journal_description journal_type journal_type_description status
        status_description
      ]
    end
  end
end
