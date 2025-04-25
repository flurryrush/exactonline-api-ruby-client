# frozen_string_literal: true

module Elmas
  # Endpoint
  # RejectQuotation
  #
  # Good to know
  # With this endpoint you can reject a quotation.
  #  The quotation status will be set to 'rejected'.
  #  The quotation can still be reopened
  #
  # Scope
  # Crm quotes
  class RejectQuotation
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "crm/RejectQuotation"
    end

    def mandatory_attributes
      %i[
        quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMRejectQuotation
    def other_attributes
      %i[
        division error_message notification_layout reason_code success_message
      ]
    end
  end
end
