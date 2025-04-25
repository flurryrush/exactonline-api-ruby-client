# frozen_string_literal: true

module Elmas
  # Endpoint
  # WBSExpense
  #
  # Good to know
  # Use this endpoint to create, read, update and delete Work Breakdown Structure (WBS) expense.
  # Note: For creating a WBS expense, it is mandatory to supply Project and Description
  #
  # Scope
  # Projects projects
  class WBSExpense
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/WBSExpenses"
    end

    def mandatory_attributes
      %i[
        description project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectWBSExpenses
    def other_attributes
      %i[
        auto_create_invoice_term block_entry block_rebilling budgeted_cost budgeted_revenue
        completed created creator creator_full_name custom_field division end_date invoice_date
        invoice_method invoice_separately invoice_term item markup_percentage modified modifier
        modifier_full_name notes part_of part_of_description project_description
        project_term_action purchase_price quantity release_invoice_term release_invoice_term_date
        release_invoice_term_has_specify_date sequence_number start_date supplier type
        update_action
      ]
    end
  end
end
