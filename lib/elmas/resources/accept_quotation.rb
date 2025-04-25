# frozen_string_literal: true

module Elmas
  # Endpoint
  # AcceptQuotation
  #
  # Good to know
  # You can accept a quotation and decide on an extra action to be taken.
  #  See the 'Action' property for possible actions.
  #  Depending on the action certain properties are required to be set.
  # For CRM standalone user, only the following values for Action are allowed:2 = Create sales invoice99 = Follow email with sign off action
  #
  # Scope
  # Crm quotes
  class AcceptQuotation
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "crm/AcceptQuotation"
    end

    def mandatory_attributes
      %i[
        quotation_id
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAcceptQuotation
    def other_attributes
      %i[
        action add_to_existing_project_success create_item_price_agreement create_project_wbs
        division error_message invoice_journal notification_layout optional_quotation_line_ids
        project_budget_type project_classification project_code project_description project_id
        project_invoice_date project_invoicing_action project_prepaind_types
        project_price_agreement project_success project_type project_wbs_part_of reason_code
        sales_invoice_success sales_order_success subscription_description subscription_start_date
        subscription_success subscription_type success_message
        update_project_budget_and_price_agreement your_ref
      ]
    end
  end
end
