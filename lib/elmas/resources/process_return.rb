# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProcessReturn
  #
  # Good to know
  # Use this endpoint to process Realized VAT or EC Sales List declaration with sent method Manual (with approval)
  #
  # Scope
  # Financial returns
  class ProcessReturn
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "financial/ProcessReturn"
    end

    def mandatory_attributes
      %i[
        request status
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialProcessReturn
    def other_attributes
      %i[
        processed
      ]
    end
  end
end
