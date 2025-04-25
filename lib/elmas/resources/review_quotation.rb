# frozen_string_literal: true

module Elmas
  # Endpoint
  # ReviewQuotation
  #
  # Good to know
  # A copy of the quotation will be created.
  #  The status of the original quotation is set to 'Closed and reviewed'
  #
  # Scope
  # Crm quotes
  class ReviewQuotation
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "crm/ReviewQuotation"
    end

    def mandatory_attributes
      %i[
        quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMReviewQuotation
    def other_attributes
      %i[
        copy_item_prices description division document error_message new_quotation_id
        order_account order_account_contact payment_condition quotation_date success_message
      ]
    end
  end
end
