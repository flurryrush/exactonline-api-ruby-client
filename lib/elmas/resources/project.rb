# frozen_string_literal: true

module Elmas
  # Endpoint
  # Project
  #
  # Good to know
  # Use this endpoint to create, read, update and delete projects.
  # Note: Projects enable you to bundle quotations, sales invoices, and time and cost entries, so that you can track work and progress by project.
  #  For POST it is mandatory to provide Code, Description and Type
  #
  # Scope
  # Projects projects
  class Project
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/Projects"
    end

    def mandatory_attributes
      %i[
        code description type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjects
    def other_attributes
      %i[
        account account_code account_contact account_name allow_additional_invoicing
        allow_member_entry_only block_entry block_invoicing block_planning block_purchasing
        block_rebilling budgeted_amount budgeted_costs budgeted_hours_per_hour_type
        budgeted_revenue budget_overrun_hours budget_type budget_type_description classification
        classification_description costs_amount_fc created creator creator_full_name
        customer_p_onumber custom_field division division_name enable_work_in_progress end_date
        fixed_price_item fixed_price_item_description has_wbs_lines include_invoice_specification
        include_specification_in_invoice_pdf internal_notes invoice_address invoice_as_quoted
        invoice_description invoice_terms is_wbs_required_for_entry manager manager_fullname
        markup_percentage modified modifier modifier_full_name notes payment_condition prepaid_item
        prepaid_item_description prepaid_type prepaid_type_description
        project_restriction_employees project_restriction_items project_restriction_rebillings
        sales_time_quantity source_quotation start_date time_quantity_to_alert type_description
        use_billing_milestones
      ]
    end
  end
end
