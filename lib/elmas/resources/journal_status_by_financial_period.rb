# frozen_string_literal: true

module Elmas
  # Endpoint
  # JournalStatusByFinancialPeriod
  #
  # Good to know
  # Obsolete, please use JournalStatusList instead
  #
  # Scope
  # Financial accounting
  class JournalStatusByFinancialPeriod
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/JournalStatusByFinancialPeriod"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialJournalStatusByFinancialPeriod
    def other_attributes
      %i[
        journal period year journal_description journal_type journal_type_description status
        status_description
      ]
    end
  end
end
