# frozen_string_literal: true

module Elmas
  # Endpoint
  # GLTransactionSource
  #
  # Good to know
  # Use this endpoint to retrieve all transaction sources.
  #  Transaction sources are used in financial entries and provide insight in how an entry is created.
  #  Example: 101 - Sales invoice: This entry is created from a sales invoice entered in the sales module
  #
  # Scope
  # Financial generalledgers
  class GLTransactionSource
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financial/GLTransactionSources"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialGLTransactionSources
    def other_attributes
      %i[
        description description_suffix
      ]
    end
  end
end
