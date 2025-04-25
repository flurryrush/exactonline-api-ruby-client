# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmailWithSignOffQuotation
  #
  # Good to know
  # Use this endpoint to create and send the quotation directly to the customer by email to perform online sign off.
  #  You can accept or reject a quotation and decide on an extra action to be taken.
  #  See the 'Action' property for possible actions.
  #  Depending on the action certain properties are required to be setFor CRM standalone user, only the following value for Action is allowed:2 = Create sales invoice
  #
  # Scope
  # Crm quotes
  class EmailWithSignOffQuotation
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "crm/EmailWithSignOffQuotation"
    end

    def mandatory_attributes
      %i[
        quotation_id email_layout
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMEmailWithSignOffQuotation
    def other_attributes
      %i[
        accept_email_layout accept_opportunity_stage action allow_provide_your_ref
        create_item_price_agreement create_project_wbs division document_layout error_message
        extra_text invoice_journal project_budget_type project_classification project_code
        project_description project_id project_invoice_date project_invoicing_action
        project_prepaid_types project_price_agreement project_type project_wbs_part_of
        quotation_date reject_email_layout reject_opportunity_stage sender_email_address subject
        subscription_date subscription_description subscription_type success_message
        update_project_budget_and_price_agreement your_ref
      ]
    end
  end
end
