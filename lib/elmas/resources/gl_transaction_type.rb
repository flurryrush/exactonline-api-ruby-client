# frozen_string_literal: true

module Elmas
  # Endpoint
  # GLTransactionType
  #
  # Good to know
  # Use this endpoint to retrieve all transaction types.
  #  Financial entries are created as specific types, some are created based on journals, like sales or purchase, other are created automatically, like from the revaluation process.
  #  Example: 80: This entry is created from revaluation.
  #  G/L transaction types can be monitored in the G/L account transactions overview.
  #  They can help to easily select the required entries
  #
  # Scope
  # Financial generalledgers
  class GLTransactionType
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financial/GLTransactionTypes"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialGLTransactionTypes
    def other_attributes
      %i[
        description description_suffix
      ]
    end
  end
end
