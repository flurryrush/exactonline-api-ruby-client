# frozen_string_literal: true

module Elmas
  # Endpoint
  # ReopenQuotation
  #
  # Good to know
  # You can reopen a quotation if it has been accepted or rejected and you need to make changes to it.
  #  After reopening the status will be 'Printed'
  #
  # Scope
  # Crm quotes
  class ReopenQuotation
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "crm/ReopenQuotation"
    end

    def mandatory_attributes
      %i[
        quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMReopenQuotation
    def other_attributes
      %i[
        division error_message success_message
      ]
    end
  end
end
