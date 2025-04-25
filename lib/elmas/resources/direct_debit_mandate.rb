# frozen_string_literal: true

module Elmas
  # Endpoint
  # DirectDebitMandate
  #
  # Good to know
  # Use this endpoint to retrieve, create, update or delete a mandate of your administration.
  #  For more information about mandate, you can visit the following help file Mandates
  #
  # Scope
  # Financial cashflow
  class DirectDebitMandate
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "cashflow/DirectDebitMandates"
    end

    def mandatory_attributes
      %i[
        account bank_account
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowDirectDebitMandates
    def other_attributes
      %i[
        attachment attachment_file_name cancellation_date created creator creator_full_name
        description division first_send main modified modifier modifier_full_name payment_type
        reference signature_date type
      ]
    end
  end
end
