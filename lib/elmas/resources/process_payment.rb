# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProcessPayment
  #
  # Good to know
  # Use this endpoint to process a payment.
  # For more information about processing payment you can go to the following help files Payment process in Exact Online, Process payments
  #
  # Scope
  # Financial cashflow
  class ProcessPayment
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "cashflow/ProcessPayments"
    end

    def mandatory_attributes
      %i[
        payment_ids
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowProcessPayments
    def other_attributes
      %i[
        bank_export_documents_url division error_message success_message
      ]
    end
  end
end
