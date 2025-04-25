# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectWBSByProject
  #
  # Good to know
  # Use this endpoint to read Work Breakdown Structure (WBS) information based on the project ID provided.
  # Note: WBS used as a method to separate deliverables and project work into smaller component.
  #  It allows better manage the scope of projects and clearly defining the expected deliverables and outcomes
  #
  # Scope
  # Projects projects
  class ProjectWBSByProject
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/ProjectWBSByProject"
    end

    def mandatory_attributes
      %i[
        description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectProjectWBSByProject
    def other_attributes
      %i[
        additional_invoicing baseline_date block_entry block_rebilling budget_overrun_hours
        completed cost created creator custom_field default_item default_item_is_mandatory division
        end_date hours invoice_method is_baseline milestone modified modifier notes parent project
        project_term purchase_markup_percentage purchase_price quantity revenue start_date supplier
        time_quantity_to_alert type
      ]
    end
  end
end
