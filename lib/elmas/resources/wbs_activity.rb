# frozen_string_literal: true

module Elmas
  # Endpoint
  # WBSActivity
  #
  # Good to know
  # Use this endpoint to create, read, update and delete Work Breakdown Structure (WBS) activity.
  # Note: For creating a WBS activity, it is mandatory to supply Project and Description
  #
  # Scope
  # Projects projects
  class WBSActivity
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/WBSActivities"
    end

    def mandatory_attributes
      %i[
        description project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectWBSActivities
    def other_attributes
      %i[
        auto_create_invoice_term block_entry budgeted_cost budgeted_hours budgeted_revenue
        budget_overrun_hours completed created creator creator_full_name custom_field default_item
        default_item_is_mandatory division end_date invoice_date invoice_method invoice_separately
        invoice_term modified modifier modifier_full_name notes part_of part_of_description
        project_description project_term_action release_invoice_term release_invoice_term_date
        release_invoice_term_has_specify_date sequence_number start_date time_quantity_to_alert
        type update_action
      ]
    end
  end
end
